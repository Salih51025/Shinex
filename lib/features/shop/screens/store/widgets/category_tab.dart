import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/loyouts/gird_layout.dart';
import 'package:shinex/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            children: [
              /// -- Brands[Markalar]
              const TBrandShowcase(images: [TImages.productImage1, TImages.productImage1, TImages.productImage1]),
              const TBrandShowcase(images: [TImages.productImage1, TImages.productImage1, TImages.productImage1]),
              const SizedBox(height: TSizes.spacebtwitems),

              /// -- Products[Ürünler]
              TSectionHeading(title: 'Beğenebilirsin', onPressed: () {}),
              const SizedBox(height: TSizes.spacebtwitems),

              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spacebtwsections),
            ],
          ),
        ),
      ],
    );
  }
}
