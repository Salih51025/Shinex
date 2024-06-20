import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/constants/text_strings.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

class TTermsandConditionsCheckbox extends StatelessWidget {
  const TTermsandConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: TSizes.spacebtwitems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              TextSpan(
                  text: TTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      )),
              TextSpan(
                text: ' ve ',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              TextSpan(
                  text: '${TTexts.termsOfUse} ',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
