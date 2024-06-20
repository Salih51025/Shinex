import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shinex/data/repositories/user/user_repository.dart';
import 'package:shinex/features/authentication/screens/login/login.dart';
import 'package:shinex/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shinex/features/authentication/screens/signup/verify_email.dart';
import 'package:shinex/navigation_menu.dart';

import '../../../utils/exceptions/firebase_auth_exception.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables[Değişkenler]
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User Data[Kimliği Doğrulanmış Kullanıcı Verilerini Alın]
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app lounch[Uygulama başlatılırken main.dart'tan çağrıldı]
  @override
  void onReady() {
    /// Remove the native splash screen[Yerel açılış ekranını kaldırın]
    FlutterNativeSplash.remove();

    /// Redirect to the appropriate screen[Uygun ekrana yönlendir]
    screenRedirect();
  }

  /// Function to Show Relevant Screen[İlgili Ekranı Gösterme Fonksiyonu]
  void screenRedirect() async {
    final user = _auth.currentUser;
    print("Kullanici: $user");

    if (user != null) {
      /// If the user is logged in[Kullanıcı oturum açmışsa]
      if (user.emailVerified) {
        /// If the user's email is verified, navigate to the main NavigationMenu[Kullanıcının e-postası doğrulandıysa ana Navigasyon Menüsü'ne gidin]
        print("E-posta doğrulandı");
        Get.offAll(() => const NavigationMenu());
      } else {
        /// If the user's email is not verified, navigate to the VerifyEmailScreen[Kullanıcının e-postası doğrulanmamışsa VerifyEmailScreen'e gidin]
        print("E-posta teyit edilmedi");
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      /// Local Storage[Yerel depolama]
      deviceStorage.writeIfNull('FirstTime', true);
      print("First time: ${deviceStorage.read('FirstTime')}");

      /// Check if it's the first time launching the app[Uygulamanın ilk kez başlatılıp başlatılmadığını kontrol edin]
      if (deviceStorage.read('FirstTime') == true) {
        /// Redirect to OnBoarding Screen if it's the first time[İlk kez oluyorsa Katılım Ekranına yönlendirin]
        Get.offAll(const OnBoardingScreen());
      } else {
        /// Redirect to login Screen if not the first time[İlk sefer değilse oturum açma ekranına yönlendir]
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  /* ------------------- Email & Password sign-in[E-posta ve Şifre ile oturum açma] --------------------------- */
  /// [EmailAuthentication] - Login[Giriş yapmak]
  Future<UserCredential> loginWithEmailEndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  /// [EmailAuthentication] - Register[kayıt olmak]
  Future<UserCredential> registerWithEmailEndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION[POSTA DOĞRULAMA]
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  /// [EmailAuthentication] - Forget Password[Şifreyi unut]
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  /// [ReAuthentication] - ReAuthentication User[Yeniden Kimlik Doğrulama Kullanıcısı]

  /* -------------------- Federated identity & social sign-in[Birleşik kimlik ve sosyal oturum açma] -------------------- */
  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      /// Trigger the authentication flow[Kimlik doğrulama akışını tetikleyin]
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      /// Obtain the auth details from the request[Kimlik doğrulama ayrıntılarını istekten alın]
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      /// Create a new creadential[Yeni bir kimlik bilgisi oluştur]
      final credentials =
          GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      /// Once signed in, return the UserCredential[Oturum açtıktan sonra UserCredential'ı döndürün]
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Bir şeyler yanlış gitti. Lütfen tekrar deneyin: $e');
      return null;
    }
  }

  /// [FacebookAuthentication] - FACEBOOK

  /* ------------------- ./end Federated identity & social sign-in[/end Birleşik kimlik ve sosyal oturum açma] -------------------- */
  /// [LogoutUser] - Valid for any authentication.[Herhangi bir kimlik doğrulama için geçerlidir.]
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }

  /// DELETE USER - Remove user Auth and Firestore Account.[KULLANICIYI SİL - Kullanıcı Kimlik Doğrulamasını ve Firestore Hesabını kaldırın.]
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Bir şeyler yanlış gitti. Lütfen tekrar deneyin.';
    }
  }
}
