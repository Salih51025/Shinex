import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shinex/common/widgets/texts/product_price_text.dart';
import 'package:shinex/common/widgets/texts/product_title_text.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/choice/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description[Seçilen Özellik Fiyatlandırması ve Açıklaması]
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkergrey : TColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Status[Başlık, Fiyat ve Stok Durumu]
              Row(
                children: [
                  const TSectionHeading(title: 'Doğrulama', showActionButton: false),
                  const SizedBox(width: TSizes.spacebtwitems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Fiyat : ', smallSize: true),

                          /// Actual Price[Asıl fiyat]
                          Text(
                            '\$25',
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spacebtwitems),

                          /// Sale Price[Satış ücreti]
                          const TProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stoklama : ', smallSize: true),
                          Text('Stokta var', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Veriation Description[Doğrulama Açıklaması]
              const TProductTitleText(
                title: 'Bu Ürün Açıklamasıdır ve en fazla 4 satıra kadar çıkabilir.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spacebtwitems),

        /// -- Attributes[Öznitellikler]
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Renkler', showActionButton: false),
            const SizedBox(height: TSizes.spacebtwitems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Yeşil', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'Mavi', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Sarı', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Boyut', showActionButton: false),
            const SizedBox(height: TSizes.spacebtwitems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
