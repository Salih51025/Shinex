import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/features/personalization/controllers/user_controller.dart';
import 'package:shinex/features/shop/screens/cart/cart.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../shimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeappbartitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: TColors.grey,
                ),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: TColors.white,
                      ),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () => Get.to(
            () => const CartScreen(),
          ),
          iconColor: TColors.white,
          counterBgColor: TColors.black,
          counterTextColor: TColors.white,
        ),
      ],
    );
  }
}
