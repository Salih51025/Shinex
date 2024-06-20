import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/features/personalization/screens/adress/widgets/single_adress.dart';
import 'package:shinex/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import 'add_new_adress.dart';

class UserAdressScreen extends StatelessWidget {
  const UserAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAdressScreen()),
        child: const Icon(Icons.add, color: TColors.white),
      ),
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Adres', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            children: [
              TSingleAdress(selectedAdress: true),
              TSingleAdress(selectedAdress: false),
            ],
          ),
        ),
      ),
    );
  }
}
