import 'package:flutter/material.dart';
import 'package:shinex/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultspace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('ATLA'),
      ),
    );
  }
}
