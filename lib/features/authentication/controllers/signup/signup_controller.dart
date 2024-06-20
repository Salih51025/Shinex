import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/data/repositories/authentication/authentication_repositories.dart';
import 'package:shinex/data/repositories/user/user_repository.dart';
import 'package:shinex/features/authentication/screens/signup/verify_email.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/popups/loaders.dart';

import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/helpers/network_menager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Veriables[Değişkeler]
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController(); // Controller for email input[E-posta girişi için denetleyici]
  final lastName = TextEditingController(); // Controller for last name input[Soyadı girişi için denetleyici]
  final userName = TextEditingController(); // Controller for user name input[Kullanıcı adı girişi için denetleyici]
  final password = TextEditingController(); // Controller for password input[Şifre girişi için kontrolü]
  final firstName = TextEditingController(); // Controller for first naem input[İlk ad girişi için denetleyici]
  final phoneNumber =
      TextEditingController(); // Controller for phone number input[telefon numarası girişi için denetleyici]
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for from validation[Doğrulamadan itibaren form anahtarı]

  /// -- SIGNUP[ÜYE OLMAK]
  void signup() async {
    try {
      /// Start Loading[Yüklemeye Başla]
      TFullScreenLoader.openLoadingDialog('Bilgilerinizi işliyoruz...', TImages.onBoardingImage1);

      /// Check Internet Connectivity[İnternet Bağlantısını Kontrol Edin]
      final isConnected = await NetworkMenager.instance.isConnected();
      if (!isConnected) {
        /// Remove Loader[Yükleyiciyi Kaldır]
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation[Form Doğrulama]
      if (!signupFormKey.currentState!.validate()) {
        /// Remove Loader[Yükleyiciyi Kaldır]
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy Check[Gizlilik Politikası Kontrolü]
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Gizlilik Politikasını Kabul Et',
          message:
              'Hesap oluşturabilmek için Gizlilik Politikası ve Kullanım Koşullarını okuyup kabul etmeniz gerekmektedir.',
        );
        return;
      }

      /// Register user in the Firebase Authentication & Save user data in the Firebase[Kullanıcıyı Firebase Kimlik Doğrulamasına kaydedin ve kullanıcı verilerini Firebase'e kaydedin]
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailEndPassword(email.text.trim(), password.text.trim());

      /// Save Authenticated user data in the Firebase Firestore[Kimliği doğrulanmış kullanıcı verilerini Firebase Firestore'a kaydedin]
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      /// Remove Loader[Yükleyiciyi Kaldır]
      TFullScreenLoader.stopLoading();

      /// Show Success Message[Başarı Mesajını Göster]
      TLoaders.successSneckBar(
          title: 'Tebrikler', message: 'Hesabınız oluşturuldu! Devam etmek için e-postayı doğrulayın.');

      /// Move to Verify Email Screen[E-postayı Doğrulama Ekranına Taşı]
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      /// Remove Loader[Yükleyiciyi Kaldır]
      TFullScreenLoader.stopLoading();

      /// Show some Generic Error to the user[Kullanıcıya bazı Genel Hatalar göster]
      TLoaders.errorSnackBar(title: 'Ups Hata!', message: e.toString());
    }
  }
}
