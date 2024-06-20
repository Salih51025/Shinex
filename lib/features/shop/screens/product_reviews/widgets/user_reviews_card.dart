import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shinex/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shinex/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/image_strings.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.user)),
                const SizedBox(width: TSizes.spacebtwitems),
                Text('Mustafa', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: TSizes.spacebtwitems),

        /// Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spacebtwitems),
            Text('01 Kasım, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spacebtwitems),
        const ReadMoreText(
          'Uygulamanın kullanıcı arayüzü oldukça sezgiseldir. Sorunsuz bir şekilde gezinebildim ve alışveriş yapabildim. İyi iş!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Daha fazla göster',
          trimCollapsedText: 'Daha az göster',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spacebtwitems),

        /// Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkergrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SHINEX'nin Mağazası", style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Kasım, 2023", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spacebtwitems),
                const ReadMoreText(
                  'Uygulamanın kullanıcı arayüzü oldukça sezgiseldir. Sorunsuz bir şekilde gezinebildim ve alışveriş yapabildim. İyi iş!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Daha fazla göster',
                  trimCollapsedText: 'Daha az göster',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spacebtwsections),
      ],
    );
  }
}
