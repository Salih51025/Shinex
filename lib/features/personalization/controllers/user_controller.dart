import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shinex/data/repositories/authentication/authentication_repositories.dart';
import 'package:shinex/data/repositories/user/user_model.dart';
import 'package:shinex/data/repositories/user/user_repository.dart';
import 'package:shinex/features/authentication/screens/login/login.dart';
import 'package:shinex/features/personalization/screens/profile/widgets/re_authenticate_user_login_from.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/helpers/network_menager.dart';
import 'package:shinex/utils/popups/full_screen_loader.dart';
import 'package:shinex/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFromKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record[Kullanıcı kaydını getir]
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider[Kullanıcı Kaydını herhangi bir Kayıt sağlayıcısından kaydedin]
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      /// First Update Rx user and then check if user data is already stored.If not store new data[Önce Rx kullanıcısını güncelleyin ve ardından kullanıcı verilerinin zaten depolanıp depolanmadığını kontrol edin. Yeni veriler depolanmıyorsa]
      await fetchUserRecord();

      /// If no record already stored.[Zaten kayıtlı bir kayıt yoksa.]
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          /// Convert Name to First and Last Name[Adı Ad ve Soyada Dönüştür]
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          /// Map data[Harita verileri]
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          /// Save user data[Kullanıcı verilerini kaydet]
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Veri kaydedilmedi',
        message:
            'Bilgileriniz kaydedilirken bir şeyler ters gitti. Verilerinizi Profilinize yeniden kaydedebilirsiniz.',
      );
    }
  }

  /// Delete Account Warning[Hesap Silme Uyarısı]
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Hesabı sil',
      middleText:
          'Hesabınızı kalıcı olarak silmek istediğinizden emin misiniz? Bu işlem geri alınamaz ve tüm verileriniz kalıcı olarak silinecektir.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Sil')),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('İptal Et'),
      ),
    );
  }

  /// Delete user Account[Kullanıcı Hesabını sil]
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('İşleme', TImages.productImage1);

      /// First re-authenticate user[Kullanıcının kimliğini ilk kez yeniden doğrulayın]
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        /// Re Verify Auth Email[Kimlik Doğrulama E-postasını Yeniden Doğrulayın]
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthLoginFrom());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Upps Hata!', message: e.toString());
    }
  }

  /// -- Re-AUTHENTICATE before deleting[Silmeden önce YENİDEN DOĞRULAYIN]
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('İşleme', TImages.productImage1);

      /// Check Internet[İnterneti kontrol edin]
      final isConnected = await NetworkMenager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFromKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .registerWithEmailEndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Upss Hata!', message: e.toString());
    }
  }

  /// Upload Profile Image[Profil Resmini Yükle]
  uploadUserProfilePicture() async {
    try {
      final image =
          await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;

        /// Upload Image[Fotoğraf yükleniyor]
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        /// Update User Image Record[Kullanıcı Görüntü Kaydını Güncelle]
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSneckBar(title: 'Tebrikler', message: 'Profil Resminiz güncellendi!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Upps Hata!', message: 'Bir şeyler yanlış gitti: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
