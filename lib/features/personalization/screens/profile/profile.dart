import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/common/widgets/images/s_circular_image.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';
import 'package:shinex/shimmer.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/constants/sizes.dart';

import 'widgets/change_name.dart';
import '../../controllers/user_controller.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Profil'),
      ),

      /// -- Body[Vücut]
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            children: [
              /// Profile Picture[Profil fotoğrafı]
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                          : TCircularImage(
                              image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Profil resmini değiştir'),
                    ),
                  ],
                ),
              ),

              /// Details[Detaylar]
              const SizedBox(height: TSizes.spacebtwitems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spacebtwitems),

              /// Heading Profile Info[Başlık Kişisel Bilgiler]
              const TSectionHeading(title: 'profil bilgisi', showActionButton: false),
              const SizedBox(height: TSizes.spacebtwitems),

              TProfileMenu(title: 'İsim', value: controller.user.value.fullName, onPressed: () {}),
              TProfileMenu(title: 'Kullanıcı adı', value: controller.user.value.userName, onPressed: () {}),

              /// Details[Detaylar]
              const SizedBox(height: TSizes.spacebtwitems),
              const Divider(),
              const SizedBox(height: TSizes.spacebtwitems),

              /// Heading Personal Info[Başlık Kişisel Bilgiler]
              const TSectionHeading(title: 'Kişisel bilgi', showActionButton: false),
              const SizedBox(height: TSizes.spacebtwitems),

              TProfileMenu(
                  title: 'Kullanici ID',
                  value: controller.user.value.id,
                  icon: Icons.copy,
                  onPressed: () => Get.to(() => const ChangeName())),
              TProfileMenu(title: 'E-Mail', value: controller.user.value.email, onPressed: () {}),
              TProfileMenu(title: 'Telefon Numarasi', value: controller.user.value.phoneNumber, onPressed: () {}),
              TProfileMenu(title: 'Cinsiyet', value: 'Erkek', onPressed: () {}),
              TProfileMenu(title: 'Doğum Tarihi', value: '03 Eylül, 2006', onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spacebtwitems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Hesabı Kapat',
                    style: TextStyle(color: Colors.red),
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
