import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shinex/common/widgets/icons/s_circular_icon.dart';
import 'package:shinex/common/widgets/images/s_rounded_image.dart';
import 'package:shinex/common/widgets/texts/product_price_text.dart';
import 'package:shinex/common/widgets/texts/product_title_text.dart';
import 'package:shinex/common/widgets/texts/s_brand_title_with_verified_icon.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productimageradius),
        color: dark ? TColors.darkgrey : TColors.softgrey,
      ),
      child: Row(
        children: [
          /// Thumbnail[Küçük resim]
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// -- Küçük Resim Resmi
                const TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true),

                /// -- Sale Tag[Satış Etiketi]
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                    ),
                  ),
                ),

                /// Favourite Icon Button[Favori Simge Düğmesi]
                const Positioned(
                  top: 5,
                  bottom: 50,
                  left: 50,
                  child: TCircularIcon(icon: Icons.favorite, color: Colors.red),
                ),
              ],
            ),
          ),

          /// Details[Detaylar]
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Yesil Nike Half Sleeves Shirt', smallSize: true),
                      SizedBox(height: TSizes.spacebtwitems / 2),
                      TBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing[Fiyatlandırma]
                      const Flexible(child: TProductPriceText(price: '256.0')),

                      /// Add to cart[Sepete ekle]
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardradiusmd),
                            bottomRight: Radius.circular(TSizes.productimageradius),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconlg * 1.2,
                          height: TSizes.iconlg * 1.2,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
