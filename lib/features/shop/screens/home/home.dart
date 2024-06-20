import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shinex/features/shop/screens/all_products/all_products.dart';
import 'package:shinex/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shinex/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shinex/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/loyouts/gird_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header[Başlık]
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar[Uygulama çubuğu]
                  THomeAppBar(),
                  SizedBox(height: TSizes.spacebtwsections),

                  /// -- Searchbar[Arama çubuğu]
                  TSearchContainer(
                    text: 'Mağazada Ara',
                  ),
                  SizedBox(height: TSizes.spacebtwsections),

                  /// -- Catagories[Kategoriler]
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultspace),
                    child: Column(
                      children: [
                        /// -- Heading[Başlık]
                        TSectionHeading(
                          title: 'Popüler Kategoriler',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spacebtwitems),

                        /// Catagories[Kategoriler]
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spacebtwsections),
                ],
              ),
            ),

            /// Body[Vücut]
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultspace),
              child: Column(
                children: [
                  /// -- Promo Slider[Promosyon Kaydırıcısı]
                  const TPromoSlider(
                    banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3],
                  ),
                  const SizedBox(height: TSizes.spacebtwsections),

                  /// -- Heading[Başlık]
                  TSectionHeading(
                    title: 'Popüler Ürünler',
                    onPressed: () => Get.to(
                      () => const AllProducts(),
                    ),
                  ),
                  const SizedBox(height: TSizes.spacebtwsections),

                  /// -- Popular Products[popüler ürünler]
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
