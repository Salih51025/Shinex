import 'package:flutter/material.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/s_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/s_brand_title_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image[Resim]
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkergrey : TColors.light,
        ),
        const SizedBox(height: TSizes.spacebtwitems),

        /// Title, Price & Size[Başlık, Fiyat ve Boyut]
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: TProductTitleText(title: 'Siyah Spor Ayakkabı', maxLines: 1)),

              /// Attributes[Öznitellikler]
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Renk ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Yeşil', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'UE 40', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
