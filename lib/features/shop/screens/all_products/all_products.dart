import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/utils/constants/sizes.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppbar(title: Text('Popüler '), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultspace),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}
