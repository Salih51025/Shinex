import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/common/widgets/icons/s_circular_icon.dart';
import 'package:shinex/common/widgets/loyouts/gird_layout.dart';
import 'package:shinex/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shinex/features/shop/screens/home/home.dart';
import 'package:shinex/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text('İstek listesi', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Icons.add,
            onPressed: () => Get.to(
              const HomeScreen(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            children: [
              TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductCardVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
