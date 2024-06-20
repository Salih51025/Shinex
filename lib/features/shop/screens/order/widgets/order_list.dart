import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spacebtwitems),
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// - Row 1[Sıra 1]
            Row(
              children: [
                /// 1 - Icon[Simgeler]
                const Icon(Icons.shield_sharp),
                const SizedBox(width: TSizes.spacebtwitems / 2),

                /// 2 - Status & Date[Durum ve Tarih]
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'İşleme',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 Nisan 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                /// 3 - Icon[Simge]
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right, size: TSizes.iconsm),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spacebtwitems),

            /// -- Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon[Simge]
                      const Icon(Icons.tag),
                      const SizedBox(width: TSizes.spacebtwitems / 2),

                      /// 2 - Status & Date[Durum ve Tarih]
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emir',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(color: TColors.primary, fontWeightDelta: 1),
                            ),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon[Simge]
                      const Icon(Icons.calendar_month),
                      const SizedBox(width: TSizes.spacebtwitems / 2),

                      /// 2 - Status & Date[Durum ve Tarih]

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gönderim Tarihi',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(color: TColors.primary, fontWeightDelta: 1),
                            ),
                            Text('03 Ağustos', style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
