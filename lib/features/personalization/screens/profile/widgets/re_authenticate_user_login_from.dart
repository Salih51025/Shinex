import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/constants/text_strings.dart';
import 'package:shinex/utils/validators/validation.dart';

import '../../../controllers/user_controller.dart';

class ReAuthLoginFrom extends StatelessWidget {
  const ReAuthLoginFrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Kullanıcının Kimliğini Yeniden Doğrula')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Form(
            key: controller.reAuthFromKey,
            child: Column(
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: TValidator.validateEmail,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.turn_right), labelText: TTexts.email),
                ),
                const SizedBox(height: TSizes.spacebtwinputfields),

                /// Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => TValidator.validateEmptyText('Şifre', value),
                    decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spacebtwinputfields),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
