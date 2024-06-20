import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/common/widgets/brand/brand_card.dart';
import 'package:shinex/common/widgets/products/sortable/sortable_products.dart';
import 'package:shinex/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppbar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            children: [
              /// Brand Detail[Markalar Detay]
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spacebtwsections),

              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
