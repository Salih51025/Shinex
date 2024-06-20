import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/sizes.dart';

/// A widget for displayed an animated loading indicator with optional text and action button.[İsteğe bağlı metin ve eylem düğmesiyle birlikte animasyonlu bir yükleme göstergesinin görüntülenmesine yönelik bir widget.]
class TAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the TAnimationLoaderWidget.[TAnimationLoaderWidget için varsayılan yapıcı.]
  ///
  /// Parameters:
  ///  - text: The text to be displayed below the animation.[Animasyonun altında görüntülenecek metin.]
  ///  - animation: The path to the lottie animation file.[Lottie animasyon dosyasının yolu.]
  ///  - showAction: Whether to show an action button below the text.[Metnin altında bir eylem düğmesinin gösterilip gösterilmeyeceği.]
  ///  - actionText: The text to be displayed on the action button.[Eylem düğmesinde görüntülenecek metin.]
  ///  - onActionPressed: Callback function to be executed when the action button is pressed.[Eylem düğmesine basıldığında yürütülecek geri arama işlevi.]
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        /// Display lottie animation[Loti animasyonunu göster]
        Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
        const SizedBox(height: TSizes.defaultspace),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: TSizes.defaultspace),
        showAction
            ? SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                  child: Text(
                    actionText!,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
                  ),
                ),
              )
            : const SizedBox(),
      ]),
    );
  }
}
