import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/success_screen/success_screen.dart';
import 'package:shinex/features/shop/screens/checkout/widgets/billing_adress_section.dart';
import 'package:shinex/navigation_menu.dart';
import 'package:shinex/utils/constants/image_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(showBackArrow: true, title: Text('Kart', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            children: [
              /// -- Items in Cart[Sepetteki Öğeler]
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spacebtwsections),

              /// -- Coupon TextField[Kupon Metin Alanı]
              const TCouponCode(),
              const SizedBox(height: TSizes.spacebtwsections),

              /// -- Billing Section[Faturalandırma Bölümü]
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing[Fiyatlandırma]
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spacebtwitems),

                    /// Divider[Bölücü]
                    Divider(),
                    SizedBox(height: TSizes.spacebtwitems),

                    /// Payment Methods[Ödeme metodları]
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spacebtwitems),

                    /// Adress[Adres]
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button[ödeme düğmesi]
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultspace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.productsSuccessIllustration, // onay ikonu
              title: 'Ödeme başarılı!',
              subTitle: 'Öğeniz yakında gönderilecek!',
              onPressed: () => Get.offAll(
                () => const NavigationMenu(),
              ),
            ),
          ),
          child: const Text('Çıkış yapmak \$256.0'),
        ),
      ),
    );
  }
}
