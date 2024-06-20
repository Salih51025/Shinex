import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../loyouts/gird_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdowm[Açılan menü]
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          onChanged: (value) {},
          items: ['İsim', 'Daha yüksek fiyat', 'Düşük fiyat', 'Satış', 'En yeni', 'Popülerlik']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spacebtwsections),

        /// Products[Ürünler]
        TGridLayout(
          itemCount: 8,
          itemBuilder: (_, index) => const TProductCardVertical(),
        ),
      ],
    );
  }
}
