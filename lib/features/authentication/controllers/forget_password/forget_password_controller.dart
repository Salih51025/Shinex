import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/data/repositories/authentication/authentication_repositories.dart';
import 'package:shinex/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/helpers/network_menager.dart';
import 'package:shinex/utils/popups/full_screen_loader.dart';
import 'package:shinex/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Veriables[Değişkenler]
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail[Şifre Sıfırlama E-Postasını Gönder]
  sendPasswordResetEmail() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('İsteğiniz işleniyor...', TImages.productImage1);

      /// Check Internet Connectivity[İnternet Bağlantısını kontrol edin]
      final isConnected = await NetworkMenager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation[Form Doğrulama]
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Send EMail to Reset Password[Şifreyi Sıfırlamak için E-Posta Gönder]
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      /// Show Success Screen[Başarı Ekranını Göster]
      TLoaders.successSneckBar(
          title: 'E-posta gönderildi', message: 'Şifrenizi sıfırlamak için e-posta bağlantısı gönderildi'.tr);

      /// Redirect[Yönlendir]
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      /// Remove Loader[Yükleyiciyi Kaldır]
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Upps Hata!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      /// Start Loading[Yüklemeye Başla]
      TFullScreenLoader.openLoadingDialog('İsteğiniz işleniyor...', TImages.productImage1);

      /// Check Internet Connectivity[İnternet Bağlantısını Kontrol Edin]
      final isConnected = await NetworkMenager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Send EMail to Reset Password[Şifreyi Sıfırlamak için E-Posta Gönder]
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      /// Show Success Screen[Başarı Ekranını Göster]
      TLoaders.successSneckBar(
          title: 'E-posta gönderildi', message: 'Şifrenizi sıfırlamak için e-posta bağlantısı gönderildi'.tr);
    } catch (e) {
      /// Remove Loader[Yükleyiciyi Kaldır]
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Upps Hata!', message: e.toString());
    }
  }
}
