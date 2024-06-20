import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/common/widgets/brand/brand_card.dart';
import 'package:shinex/common/widgets/loyouts/gird_layout.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';
import 'package:shinex/features/shop/screens/brand/brand_products.dart';
import 'package:shinex/utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(title: Text('Marka'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            children: [
              /// Heading[Başlık]
              const TSectionHeading(title: 'Markalar', showActionButton: false),
              const SizedBox(height: TSizes.spacebtwitems),

              /// -- Brands[Markalar]
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(
                    () => const BrandProducts(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
