import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/loaders/animation_loader.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.[Tam ekran yükleme iletişim kutusunu yönetmek için bir yardımcı program sınıfı.]
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.[Belirli bir metin ve animasyonla tam ekran yükleme iletişim kutusunu açın.]
  /// this method doesnt return anything.[bu yöntem hiçbir şey döndürmez.]
  ///
  /// Parameters:[Parametreler]
  ///   - text: The text to be displayed in the loading dialog.[Yükleme iletişim kutusunda görüntülenecek metin.]
  ///   - animation: The Lottie animation to be shown.[Lottie animasyonu gösterilecek.]
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      /// Use Get.overlayContextm for overlay dialogs[Kaplama iletişim kutuları için Get.overlayContextm'i kullanın]
      context: Get.overlayContext!,

      /// The dialog can't be dismissed by tapping outside it[Diyalog dışına dokunularak kapatılamaz]
      barrierDismissible: false,
      builder: (_) => PopScope(
        /// Disable popping with the back button[Geri düğmesiyle popping'i devre dışı bırakın]
        canPop: false,
        child: Expanded(
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                /// Adjust the spacing as needed[Aralığı gerektiği gibi ayarlayın]
                const SizedBox(height: 250),
                TAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.[Şu anda açık olan yükleme iletişim kutusunu durdurun.]
  /// This method doesn't return anything.[Bu yöntem hiçbir şey döndürmez.]
  static stopLoading() {
    /// Close the dialog using the Navigator[Gezgin'i kullanarak iletişim kutusunu kapatın]
    Navigator.of(Get.overlayContext!).pop();
  }
}
