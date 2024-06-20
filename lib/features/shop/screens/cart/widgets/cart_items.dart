import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spacebtwsections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item[Sepet Öğesi]
          const TCartItem(),
          if (showAddRemoveButtons) const SizedBox(height: TSizes.spacebtwitems),

          /// Add Remive Button Row With total Price[Toplam Fiyatla Kaldır Düğmesi Satırını Ekle]
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space[Ekstra alan]
                    SizedBox(width: 70),

                    /// Add Remove Buttons[Ekle Kaldır Düğmeleri]
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),

                /// -- Product total price[Ürün toplam fiyatı]
                TProductPriceText(price: '256'),
              ],
            ),
        ],
      ),
    );
  }
}
