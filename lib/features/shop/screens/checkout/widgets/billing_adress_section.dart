import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';
import 'package:shinex/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Gönderi Adresi', buttonTitle: 'Değiştirmek', onPressed: () {}),
        Text('S ile kodlama', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spacebtwitems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spacebtwitems),
            Text('+90 537 573 1878', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spacebtwitems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spacebtwitems),
            Text('Bursa Turkey', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
        const SizedBox(height: TSizes.spacebtwitems / 2),
      ],
    );
  }
}
