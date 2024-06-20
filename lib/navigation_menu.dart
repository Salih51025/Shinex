import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/features/personalization/screens/settings/settings.dart';
import 'package:shinex/features/shop/screens/home/home.dart';
import 'package:shinex/features/shop/screens/store/store.dart';
import 'package:shinex/features/shop/screens/wishlist/wishlist.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Anasayfa'),
            NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), label: 'Mağaza'),
            NavigationDestination(icon: Icon(Icons.favorite_outline), label: 'istek listesi'),
            NavigationDestination(icon: Icon(Icons.person_outlined), label: 'Profil'),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
