import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shinex/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/constants/text_strings.dart';
import 'package:shinex/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & last Name[İlk ve soyadı]
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('ilk adı', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spacebtwinputfields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('Soy adı', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spacebtwinputfields),

          /// Username[Kullanıcı adı]
          TextFormField(
            validator: (value) => TValidator.validateEmptyText('Kullanıcı adı', value),
            controller: controller.userName,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: TSizes.spacebtwinputfields),

          /// Email[E-posta]
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: TSizes.spacebtwinputfields),

          /// Phone Number[Telefon numarası]
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: TTexts.pheneNo,
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: TSizes.spacebtwinputfields),

          /// Password[Şifre]
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spacebtwinputfields),

          /// Terms&Conditions Checkbox[Şartlar ve Koşullar Onay Kutusu]
          const TTermsandConditionsCheckbox(),
          const SizedBox(height: TSizes.spacebtwsections),

          /// signin Up Button[kaydolma Yukarı Düğmesi]
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
