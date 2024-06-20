import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/data/repositories/user/user_repository.dart';
import 'package:shinex/features/personalization/controllers/user_controller.dart';
import 'package:shinex/features/personalization/screens/profile/profile.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/helpers/network_menager.dart';
import 'package:shinex/utils/popups/full_screen_loader.dart';
import 'package:shinex/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears[Ana Ekran göründüğünde kullanıcı verilerini başlatın]
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record[Kullanıcı kaydını getir]
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      /// Start Loading[Yüklemeye Başla]
      TFullScreenLoader.openLoadingDialog('Bilgilerinizi güncelliyoruz...', TImages.productImage1);

      /// Check Internet Connectivity[İnternet Bağlantısını Kontrol Edin]
      final isConnected = await NetworkMenager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation[Form Doğrulama]
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Update users first & last name in the Firebase Firestore[Firebase Firestore'da kullanıcıların adını ve soyadını güncelleyin]
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      /// Update the Rx User value[Rx Kullanıcı değerini güncelleyin]
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Remove Loader[Yükleyiciyi Kaldır]
      TFullScreenLoader.stopLoading();

      /// Show Success Message[Başarı Mesajını Göster]
      TLoaders.successSneckBar(title: 'Tebrikler', message: 'Adınız güncellendi.');

      /// Move to previous screen.[Önceki ekrana geçin.]
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Uppss Hata!', message: e.toString());
    }
  }
}
