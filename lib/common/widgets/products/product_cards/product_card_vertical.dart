import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/styles/shadows.dart';
import 'package:shinex/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shinex/common/widgets/images/s_rounded_image.dart';
import 'package:shinex/common/widgets/texts/product_price_text.dart';
import 'package:shinex/common/widgets/texts/product_title_text.dart';
import 'package:shinex/features/shop/screens/product_details/product_detail.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

import '../../icons/s_circular_icon.dart';
import '../../texts/s_brand_title_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow.[Yan dolgular, renk, kenarlar, yarıçap ve gölge içeren kap.]
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productimageradius),
          color: dark ? TColors.darkergrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag[Küçük Resim, İstek Listesi Düğmesi, İndirim Etiketi]

            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image[Küçük Resim Resmi]
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

                  /// -- Favorite Icon Button[Favori Simge Düğmesi]
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spacebtwitems / 2),

            /// -- Details[Detaylar]
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: 'Green Nike Air Ayakkabi', smallSize: true),
                  SizedBox(height: TSizes.spacebtwitems / 2),
                  TBrandTitleWithVerifiedIcon(title: 'NIke'),
                ],
              ),
            ),

            const Spacer(),

            /// Price Row[Fiyat Satırı]
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price[Fiyat]
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: '35.5'),
                ),

                /// Add to Cart Button[Sepete Ekle Düğmesi]
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
    );
  }
}
