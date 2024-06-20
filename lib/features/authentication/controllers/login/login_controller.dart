import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shinex/data/repositories/authentication/authentication_repositories.dart';
import 'package:shinex/features/personalization/controllers/user_controller.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/helpers/network_menager.dart';
import 'package:shinex/utils/popups/full_screen_loader.dart';
import 'package:shinex/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// Veriables[Değişkenler]
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStore = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStore.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStore.read('REMEMBER_ME_PASSWORD') ?? '';

    super.onInit();
  }

  /// -- Email and Password SignIn[E-posta ve Şifre Oturum Açma]
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// Start Loading[Yüklemeye Başla]
      TFullScreenLoader.openLoadingDialog('Oturumunuz açılıyor...', TImages.productImage1);

      /// Check Internet Connectivity[İnternet Bağlantısını Kontrol Edin]
      final isConnected = await NetworkMenager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation[Form Doğrulama]
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Save data if remember me is selected[Beni hatırla seçiliyse verileri kaydet]
      if (rememberMe.value) {
        localStore.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStore.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      /// Login user using EMail & Password Authentication[E-Posta ve Şifre Kimlik Doğrulamasını kullanarak kullanıcıyla oturum açın]
      // final userCredentials =
      //     await AuthenticationRepository.instance.loginWithEmailEndPassword(email.text.trim(), password.text.trim());

      /// Remove Loader[Yükleyiciyi Kaldır]
      TFullScreenLoader.stopLoading();

      /// Redirect[Yönlendir]
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Upps Hata!', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication[Google Oturum Açma Kimlik Doğrulaması]
  Future<void> googleSignIn() async {
    try {
      /// Start Loading[Yüklemeye Başla]
      TFullScreenLoader.openLoadingDialog('Oturumunuz açılıyor...', TImages.darkAppLogo);

      /// Check Internet Connectivity[İnternet Bağlantısını Kontrol Edin]
      final isConnected = await NetworkMenager.instance.isConnected();
      if (isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Google Authentication[Google Kimlik Doğrulaması]
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      /// Save User Record[Kullanıcı Kaydını Kaydet]
      await userController.saveUserRecord(userCredentials);

      /// Remove loader[Yükleyiciyi kaldır]
      TFullScreenLoader.stopLoading();

      /// Redirect[Yönlendir]
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      /// Remove loader[Remove loader]
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Upss Hata', message: e.toString());
    }
  }
}
