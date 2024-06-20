import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    if (value == 'Yeşil') {
      return Colors.green;
    } else if (value == 'Yeşil') {
      return Colors.green;
    } else if (value == 'Kırmızı') {
      return Colors.red;
    } else if (value == 'Mavi') {
      return Colors.blue;
    } else if (value == 'Pembe') {
      return Colors.pink;
    } else if (value == 'Gri') {
      return Colors.grey;
    } else if (value == 'Mor') {
      return Colors.purple;
    } else if (value == 'Siyah') {
      return Colors.black;
    } else if (value == 'Beyaz') {
      return Colors.white;
    } else if (value == 'Sarı') {
      return Colors.yellow;
    } else if (value == 'Turuncu') {
      return Colors.orange;
    } else if (value == 'Kahverengi') {
      return Colors.brown;
    } else if (value == 'turkuaz') {
      return Colors.teal;
    } else if (value == 'Çivit mavisi') {
      return Colors.indigo;
    }
    return null;
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncareText(String text, int maxlength) {
    if (text.length <= maxlength) {
      return text;
    } else {
      return '${text.substring(0, maxlength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowsize) {
    final wrappedlist = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowsize) {
      final rowChildren = widgets.sublist(i, i + rowsize > widgets.length ? widgets.length : i + rowsize);
      wrappedlist.add(
        Row(
          children: rowChildren,
        ),
      );
    }
    return wrappedlist;
  }
}
