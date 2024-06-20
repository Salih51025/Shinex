import 'package:flutter/material.dart';
import 'package:shinex/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/device/device_utility.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

class OnBoardingNextBotton extends StatelessWidget {
  const OnBoardingNextBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultspace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primary : Colors.black,
        ),
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
