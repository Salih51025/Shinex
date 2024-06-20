import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/common/widgets/images/s_rounded_image.dart';
import 'package:shinex/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(title: Text('Spor gömlekleri'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(children: [
            /// Banner[Afiş]
            const TRoundedImage(width: double.infinity, imageUrl: TImages.promoBanner3, applyImageRadius: true),
            const SizedBox(height: TSizes.spacebtwsections),

            /// Sub-Categories[Alt Kategoriler]
            Column(
              children: [
                /// Heading[Başlık]
                TSectionHeading(title: 'Spor gömlekleri', onPressed: () {}),
                const SizedBox(height: TSizes.spacebtwitems / 2),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: TSizes.spacebtwitems),
                    itemBuilder: (context, index) => const TProductCardHorizontal(),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
