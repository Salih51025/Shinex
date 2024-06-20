import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shinex/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Veriables[Değişkenler]
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll[Sayfa Kaydırıldığında Geçerli Dizini Güncelle]
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.[Seçilen belirli nokta sayfasına atlayın.]
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & jump to next page[Mevcut Dizini Güncelle ve sonraki sayfaya atla]
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode) {
        print('=========== DEPOLAMA ALIN Sonraki Düğmesi ============');
        print(storage.read('FirstTime'));
      }

      storage.write('FirstTime', false);
      Get.to(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jumo to the last Page[Mevcut Dizini ve jumo'yu son Sayfaya Güncelle]
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
