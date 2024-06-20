import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shinex/common/widgets/loyouts/gird_layout.dart';
import 'package:shinex/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';
import 'package:shinex/features/shop/screens/brand/all_brands.dart';
import 'package:shinex/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        /// Appbar[Uygulama çubuğu]
        appBar: TAppbar(
          title: Text('Mağaza', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          /// -- Header[Başlık]
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultspace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar[Arama çubuğu]
                      const SizedBox(height: TSizes.spacebtwitems),
                      const TSearchContainer(
                          text: 'Mağazada Ara', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spacebtwsections),

                      /// -- Featured Brands[Öne Çıkan Markalar]
                      TSectionHeading(
                        title: 'Öne Çıkan Markalar',
                        onPressed: () => Get.to(
                          () => const AllBrandScreen(),
                        ),
                      ),
                      const SizedBox(height: TSizes.spacebtwitems / 1.5),

                      /// -- Brands GRID[Markalar Kafes]
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const TBrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),

                /// Tabs[Sekmeler]
                bottom: const TTabbar(
                  tabs: [
                    Tab(child: Text('Spor')),
                    Tab(child: Text('Mobilya')),
                    Tab(child: Text('Elektronik')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Kozmetik')),
                  ],
                ),
              ),
            ];
          },

          /// Body[Vücut]
          body: const TabBarView(
            children: [TCategoryTab(), TCategoryTab(), TCategoryTab(), TCategoryTab(), TCategoryTab()],
          ),
        ),
      ),
    );
  }
}
