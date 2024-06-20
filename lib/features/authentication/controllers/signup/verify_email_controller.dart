import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repositories.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.[Doğrulama Ekranı göründüğünde E-posta Gönder ve otomatik yönlendirme için Zamanlayıcıyı Ayarla.]
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link[E-posta Doğrulama Bağlantısını Gönder]
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.errorSnackBar(
          title: 'Email Gönderilmiş', message: 'Lütfen gelen kutunuzu kontrol edin ve e-postanızı doğrulayın.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Upps Hata!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification[E-posta Doğrulamasında otomatik olarak yönlendirme için zamanlayıcı]
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        navigateToSuccessScreen();
      }
    });
  }

  /// Maually Check if Email Verified[E-postanın Doğrulanıp Doğrulanmadığını Manuel olarak Kontrol Edin]
  void checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      navigateToSuccessScreen();
    }
  }

  /// [E-Posta Onaylandı İse Kullanıcıyı bu sayfaya yönlendirip , devam et butonuna bastığında da anasayfaya girmesini sağlıyoruz]
  void navigateToSuccessScreen() {
    Get.offAll(
      () => SuccessScreen(
        image: TImages.productsSuccessIllustration,
        title: TTexts.yourAccountCreatedTitle,
        subTitle: TTexts.yourAccountCreatedSubTitle,
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ),
    );
  }
}
