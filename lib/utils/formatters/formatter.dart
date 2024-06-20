import 'package:intl/intl.dart';

class Tformatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'tr_TUR', symbol: '/₺').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    /// Assuming a 10-digit TR phone number format: (123) 456-7890[10 haneli TR telefon numarası biçimini varsayarsak: (123) 456-7890]
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }

    /// Add more custom phone number formatting logic for different formats if needed.[Gerekirse farklı biçimler için daha fazla özel telefon numarası biçimlendirme mantığı ekleyin.]
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    /// Remove any non-digit characters from the phone number[Telefon numarasından rakam olmayan karakterleri kaldırın]
    var digitOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    /// Extract the country code from the digitOnly[Ülke kodunu rakamOnly'den çıkarın]
    String countryCode = '+${digitOnly.substring(0, 2)}';
    digitOnly = digitOnly.substring(2);

    /// Add the remaining digits with proper formatting[Kalan rakamları uygun biçimlendirmeyle ekleyin]
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitOnly.length) {
      int grouplength = 2;
      if (i == 0 && countryCode == '+1') {
        grouplength = 3;
      }

      int end = i + grouplength;
      formattedNumber.write(digitOnly.substring(i, end));

      if (end < digitOnly.length) {
        formattedNumber.write('');
      }
      i = end;
    }
    return '';
  }
}
