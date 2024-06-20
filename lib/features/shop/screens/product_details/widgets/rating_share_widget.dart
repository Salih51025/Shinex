import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class TRatingandShare extends StatelessWidget {
  const TRatingandShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating[Değerlendirme]
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 24),
            const SizedBox(height: TSizes.spacebtwitems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),

        /// Share Button[Paylaş butonu]
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share, size: TSizes.iconmd),
        ),
      ],
    );
  }
}
