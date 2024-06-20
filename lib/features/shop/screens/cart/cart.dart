import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/features/shop/screens/checkout/checkout.dart';
import 'package:shinex/utils/constants/sizes.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Kart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultspace),

        /// -- Items in Cart[Sepetteki Öğeler]
        child: TCartItems(),
      ),

      /// Checkout Button[Ödeme Düğmesi]
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultspace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => const CheckoutScreen(),
          ),
          child: const Text('Çıkış yapmak \$256.0'),
        ),
      ),
    );
  }
}
