import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shinex/common/widgets/texts/section_heading.dart';
import 'package:shinex/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shinex/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:shinex/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:shinex/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shinex/utils/constants/sizes.dart';

import 'widgets/product_detail_image.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product image Slider[Ürün resmi Kaydırıcısı]
            const TProductImageSlider(),

            /// 2 - Product Details[Ürün detayları]
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultspace, left: TSizes.defaultspace, bottom: TSizes.defaultspace),
              child: Column(
                children: [
                  /// -- Rating & Share Button[Derecelendirme ve Paylaş Düğmesi]
                  const TRatingandShare(),

                  /// -- Price, Title, Stock, & Brand[Fiyat, Başlık, Stok ve Marka]
                  const TProductMetaData(),

                  /// -- Attributes[Öznitellikler]
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spacebtwsections),

                  /// Checkout Button[Ödeme Düğmesi]
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Çıkış yap'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spacebtwsections),

                  /// Description[Tanım]
                  const TSectionHeading(title: 'Tanım', showActionButton: false),
                  const SizedBox(height: TSizes.spacebtwitems),
                  const ReadMoreText(
                    'Bu, Mavi Nike Kolsuz yelek için bir Ürün açıklamasıdır. Eklenebilecek daha çok şey var ama ben sadece pratik yapıyorum, başka bir şey değil.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Daha fazla göster',
                    trimExpandedText: 'Daha az göster',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews[Yorumlar]
                  const Divider(),
                  const SizedBox(height: TSizes.spacebtwitems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Yorumlar(199)', showActionButton: false),
                      IconButton(
                        onPressed: () => Get.to(
                          () => const ProductReviewsScreen(),
                        ),
                        icon: const Icon(Icons.arrow_right, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spacebtwsections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
