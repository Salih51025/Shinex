class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'GEÇERSİZ GİRİŞ BİLGİLERİ':
        return 'Geçersiz giriş bilgileri. Lütfen bilgilerinizi tekrar kontrol ediniz.';
      case 'çok fazla istek':
        return 'Çok fazla istek. Lütfen daha sonra tekrar deneyiniz.';
      case 'geçersiz şifre':
        return 'Yanlış parola. Lütfen tekrar deneyin.';
      case 'Geçersiz telefon numarası':
        return 'Yanlış telefon numarası. Lütfen tekrar deneyin.';
      case 'izin verilmeyen işlem':
        return 'Incorrect password. Please try again.';
      case 'oturum çerezinin süresi doldu':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'uid-zaten-var':
        return 'The provided user ID is already in use by another user.';
      case 'oturum açma başarısız':
        return 'Sign_in failed. Please try again.';
      case 'ağ isteği başarısız oldu':
        return 'Network request failed. Please check your internet connection.';
      case 'iç hata':
        return 'Internal error. Please try again later.';
      case 'geçersiz-doğrulama-kodu':
        return 'Invalid verification code. Please enter a valid code.';
      default:
        return 'An unexpected Firebase error accurred. Please try again.';
    }
  }
}
