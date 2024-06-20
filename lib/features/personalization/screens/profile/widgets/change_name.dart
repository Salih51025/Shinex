import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/appbar/appbar.dart';
import 'package:shinex/update_name_controller.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/constants/text_strings.dart';
import 'package:shinex/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom Appbar[Özel Uygulama Çubuğu]
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('İsmini değiştir', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultspace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings[Başlıklar]
            Text('Kolay doğrulama için gerçek adı kullanın. Bu ad birkaç sayfada görünecektir.',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spacebtwsections),

            /// Text field and Button[Metin alanı ve Düğme]
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText('Adı', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: TSizes.spacebtwinputfields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText('SoyAdı', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spacebtwsections),

            /// Save Button[Kaydet Düğmesi]
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Kaydet'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
