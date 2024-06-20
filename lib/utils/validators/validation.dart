/// VALIDATION CLASS[DOĞRULAMA SINIFI]
class TValidator {
  /// Empty Text Validation[Boş Metin Doğrulaması]
  static String? validateEmptyText(String? firstName, String? value) {
    if (value == null || value.isEmpty) {
      return '$firstName gereklidir.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email gereklidir.';
    }

    /// Regular expression for email validation[E-posta doğrulaması için normal ifade]
    final emailRegExp = RegExp('');

    if (!emailRegExp.hasMatch(value)) {
      return 'Geçersiz e-posta adresi.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre gereklidir.';
    }

    /// Check for minimum password lenght[Minimum şifre uzunluğunu kontrol edin]
    if (value.length < 6) {
      return 'Şifre en az 6 karakter uzunluğunda olmalı.';
    }

    /// Check for uppercase letters[Büyük harfleri kontrol edin]
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Şifre en az bir büyük harf içermelidir.';
    }

    /// Check for numbers[Numaraları kontrol edin]
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Şifre en az bir sayı içermelidir.';
    }

    /// Check for special characters[Özel karakterleri kontrol edin]
    if (!value.contains(RegExp(r'[!@#$%^&*,.?";{}|<>]'))) {
      return 'Şifre en az bir özel karakter içermelidir.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon numarası gereklidir.';
    }

    /// Regular expression for phone number validation (assuming a 10-digit US phone number format)[Telefon numarası doğrulaması için normal ifade (10 basamaklı ABD telefon numarası biçimi varsayılarak)]
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Geçersiz telefon numarası biçimi (10 hane gerekli)';
    }

    return null;
  }

  /// Add more custom validators as needed for your specific requirements.[Özel gereksinimleriniz için gerektiği kadar daha fazla özel doğrulayıcı ekleyin.]
}
