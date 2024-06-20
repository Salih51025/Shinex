import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSingleAdress extends StatelessWidget {
  const TSingleAdress({
    super.key,
    required this.selectedAdress,
  });

  final bool selectedAdress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: selectedAdress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAdress
          ? Colors.transparent
          : dark
              ? TColors.darkergrey
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spacebtwitems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAdress ? Icons.approval : null,
              color: selectedAdress
                  ? dark
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '453 Toki Baykoca Mah, Defne Sok, Inegol Bursa',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '+90 537 573 1878',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                '453 Toki Baykoca Mah, Defne Sok, Inegol Bursa',
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
