import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/s_circular_icon.dart';
import '../../../../../common/widgets/images/s_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        decoration: BoxDecoration(
          color: dark ? TColors.darkergrey : TColors.light,
        ),
        child: Stack(
          children: [
            /// Main Large Image[Ana Büyük Resim]
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productimageradius * 2),
                child: Center(child: Image(image: AssetImage(TImages.productImage1))),
              ),
            ),

            /// Image Slider[Resim Kaydırıcısı]
            Positioned(
              right: TSizes.defaultspace,
              bottom: 30,
              left: TSizes.spacebtwitems,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spacebtwitems),
                  itemBuilder: (_, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: TImages.productImage1,
                  ),
                ),
              ),
            ),

            /// Appbar Icons[Uygulama Çubuğu Simgeleri]
            const TAppbar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Icons.favorite, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
