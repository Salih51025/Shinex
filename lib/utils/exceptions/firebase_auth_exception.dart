/// Custom exception class to handle various Firebase authentication-related errors.[Firebase kimlik doğrulamasıyla ilgili çeşitli hataları işlemek için özel istisna sınıfı.]
class TFirebaseAuthException implements Exception {
  /// The errror code associated with the exception.[İstisnayla ilişkili hata kodu.]
  final String code;

  /// Constructor that takes an error code.[Hata kodunu alan yapıcı.]
  TFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.[Hata koduna göre ilgili hata mesajını alın.]
  String get message {
    switch (code) {
      case 'e-posta zaten kullanımda':
        return 'E-posta adresi zaten kayıtlı. Lütfen farklı bir e-posta kullanın.';
      case 'Geçersiz e-posta':
        return 'Sağlanan e-posta adresi geçersiz. Lütfen geçerli eposta adresini giriniz.';
      case 'zayıf şifre':
        return 'Şifre çok zayıf. Lütfen daha güçlü bir şifre seçin.';
      case 'kullanıcı tarafından devre dışı bırakıldı':
        return 'Bu kullanıcı hesabı devre dışı bırakıldı. Yardım için lütfen desteğe başvurun.';
      case 'Kullanıcı bulunamadı':
        return 'Geçersiz giriş detayları. Kullanıcı bulunamadı.';
      case 'yanlış şifre':
        return 'Yanlış parola. Lütfen şifrenizi kontrol edip tekrar deneyin.';
      case 'geçersiz-doğrulama-kodu':
        return 'Geçersiz doğrulama kodu. Lütfen geçerli bir kod girin.';
      case 'geçersiz doğrulama kimliği':
        return 'Geçersiz doğrulama kimliği. Lütfen yeni bir doğrulama kodu isteyin.';
      case 'kota aşıldı':
        return 'Kota aşıldı. Lütfen daha sonra tekrar deneyiniz.';
      case 'Bu e-posta zaten var':
        return 'E-posta adresi zaten mevcut. Lütfen farklı bir e-posta kullanın.';
      case 'sağlayıcıya zaten bağlı':
        return 'Hesap zaten başka bir sağlayıcıya bağlı.';
      case 'yeni giriş yapılması gerekiyor':
        return 'Bu opatasyon hassastır ve yakın zamanda kimlik doğrulaması gerektirir. Lütfen tekrar giriş yapın.';
      case 'kimlik bilgisi-zaten kullanımda':
        return 'Bu kimlik bilgisi zaten farklı bir kullanıcı hesabıyla ilişkilendirilmiş.';
      default:
        return 'Beklenmeyen bir Firebase hatası oluştu. Lütfen tekrar deneyin.';
    }
  }
}
