import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/images/s_circular_image.dart';
import 'package:shinex/common/widgets/texts/product_price_text.dart';
import 'package:shinex/common/widgets/texts/product_title_text.dart';
import 'package:shinex/common/widgets/texts/s_brand_title_with_verified_icon.dart';
import 'package:shinex/utils/constants/enums.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price[Fiyat & Satış Fiyatı]
        Row(
          children: [
            /// Sale Tag[Satış Etiketi]
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spacebtwitems),

            /// Price[Fiyat]
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spacebtwitems),
            const TProductPriceText(price: '175'),
          ],
        ),
        const SizedBox(width: TSizes.spacebtwitems / 1.5),

        /// Title[Başlık]
        const TProductTitleText(title: 'Yeşil Nike Spor Tişort'),
        const SizedBox(width: TSizes.spacebtwitems / 1.5),

        /// Stack Status[Yığın Durumu]
        Row(
          children: [
            const TProductTitleText(title: 'Durum'),
            const SizedBox(width: TSizes.spacebtwitems),
            Text('Stokta var', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: TSizes.spacebtwitems / 1.5),

        /// Brand[Marka]
        Row(
          children: [
            TCircularImage(
              image: TImages.cosmeticsIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.dark,
            ),
            const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
