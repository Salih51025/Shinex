import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/icons/s_circular_icon.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultspace, vertical: TSizes.defaultspace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkergrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardradiuslg),
          topRight: Radius.circular(TSizes.cardradiuslg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Icons.remove,
                backgroundColor: TColors.darkergrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const SizedBox(width: TSizes.spacebtwitems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSizes.spacebtwitems),
              const TCircularIcon(
                icon: Icons.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text('Sepete ekle'),
          ),
        ],
      ),
    );
  }
}
