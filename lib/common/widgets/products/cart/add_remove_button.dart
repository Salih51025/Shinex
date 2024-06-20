import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/s_circular_icon.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Icons.remove,
          width: 60,
          height: 60,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkgrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spacebtwitems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spacebtwitems),
        const TCircularIcon(
          icon: Icons.add,
          width: 60,
          height: 60,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
