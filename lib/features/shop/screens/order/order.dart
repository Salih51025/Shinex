import 'package:flutter/material.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/utils/constants/sizes.dart';

import 'widgets/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar[Uygulama çubuğu]
      appBar: TAppbar(
        title: Text('Siparişlerim', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultspace),

        /// -- Orders[Emirler]
        child: TOrderListItems(),
      ),
    );
  }
}
