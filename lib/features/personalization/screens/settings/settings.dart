import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shinex/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';
import 'package:shinex/features/authentication/screens/login/login.dart';
import 'package:shinex/features/personalization/screens/adress/adress.dart';
import 'package:shinex/features/personalization/screens/profile/profile.dart';
import 'package:shinex/features/shop/screens/order/order.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header[Başlık]
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar[Uygulama çubuğu]
                  TAppbar(
                    title: Text(
                      'Hesap',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),

                  /// User Profile Card[Kullanıcı Profili Kartı]
                  TUserProfileTile(
                    onPressed: () => Get.to(
                      () => const ProfileScreen(),
                    ),
                  ),
                  const SizedBox(height: TSizes.spacebtwsections),
                ],
              ),
            ),

            /// -- Body[Vücut]
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultspace),
              child: Column(
                children: [
                  /// -- Account Settings[Hesap ayarları]
                  const TSectionHeading(title: 'Hesap ayarları', showActionButton: false),
                  const SizedBox(height: TSizes.spacebtwitems),

                  TSettingsMenuTile(
                    icon: Icons.home_outlined,
                    title: 'Benim Adresim',
                    subTitle: 'Alışveriş teslimat adresini ayarlayın',
                    onTap: () => Get.to(() => const UserAdressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.credit_card_outlined,
                    title: 'Benim Kartim',
                    subTitle: 'Alışveriş teslimat adresini ayarlayın',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.bakery_dining,
                    title: 'Benim Bankam',
                    subTitle: 'Alışveriş teslimat adresini ayarlayın',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.badge_outlined,
                    title: 'Benim Emirlerim',
                    subTitle: 'Alışveriş teslimat adresini ayarlayın',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.discount_outlined,
                    title: 'Benim Kuponlarim',
                    subTitle: 'Alışveriş teslimat adresini ayarlayın',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.notifications,
                    title: 'Bildirimler',
                    subTitle: 'Alışveriş teslimat adresini ayarlayın',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.system_security_update,
                    title: 'Guvenli kart',
                    subTitle: 'Alışveriş teslimat adresini ayarlayın',
                    onTap: () {},
                  ),

                  /// -- App Settings[Uygulama ayarları]
                  const SizedBox(height: TSizes.spacebtwsections),
                  const TSectionHeading(title: 'Uygulama Ayarları', showActionButton: false),
                  const SizedBox(height: TSizes.spacebtwitems),
                  const TSettingsMenuTile(
                    icon: Icons.document_scanner,
                    title: 'Veri yükle',
                    subTitle: 'Verileri Cloud Firebaseinize yükleyin',
                  ),
                  TSettingsMenuTile(
                    icon: Icons.location_city_outlined,
                    title: 'coğrafi konum',
                    subTitle: 'Verileri Cloud Firebaseinize yükleyin',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.image,
                    title: 'güvenli mod',
                    subTitle: 'Verileri Cloud Firebaseinize yükleyin',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.image,
                    title: 'HD Görüntü Kalitesi',
                    subTitle: 'Verileri Cloud Firebaseinize yükleyin',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// -- Logout Button[Oturumu Kapat Düğmesi]
                  const SizedBox(height: TSizes.spacebtwsections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      child: const Text('Cıkış'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spacebtwsections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
