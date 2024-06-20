import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/data/repositories/authentication/authentication_repositories.dart';
import 'package:shinex/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/constants/text_strings.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        /// Padding to Give Default Equal Space on all screens.[Tüm ekranlarda Varsayılan Eşit Alan Verecek Dolgu.]
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            children: [
              /// Image[Resim]
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spacebtwsections),

              /// Title & SubTitle[Başlık ve Alt Başlık]
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spacebtwitems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spacebtwitems),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spacebtwsections),

              /// Buttons[Düğmeler]
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text('Devam Et'),
                ),
              ),
              const SizedBox(height: TSizes.spacebtwitems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(TTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
