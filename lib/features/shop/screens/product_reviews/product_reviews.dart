import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/utils/constants/sizes.dart';

import '../../../../common/widgets/products/ratings/ratings_indicator.dart';
import 'widgets/rating_progress_indicator.dart';
import 'widgets/user_reviews_card.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar[Uygulama çubuğu]
      appBar: const TAppbar(
        title: Text('İncelemeler ve Derecelendirmeler'),
        showBackArrow: true,
      ),

      /// -- Body[Vücut]
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Derecelendirmeler ve incelemeler doğrulanmıştır ve sizin kullandığınız cihaz türünü kullanan kişilerden gelmektedir.'),
              const SizedBox(height: TSizes.spacebtwitems),

              /// Overall Product Ratings[Genel Ürün Derecelendirmeleri]
              const TOverallProductRatings(),
              const TRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spacebtwsections),

              /// User Reviews List[Kullanıcı İncelemeleri Listesi]
              const UserReviewsCard(),
              const UserReviewsCard(),
              const UserReviewsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
