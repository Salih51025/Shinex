import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/features/authentication/controllers/login/login_controller.dart';
import 'package:shinex/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shinex/features/authentication/screens/signup/signup.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/constants/text_strings.dart';
import 'package:shinex/utils/validators/validation.dart';

class TLoginFrom extends StatelessWidget {
  const TLoginFrom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spacebtwsections),
        child: Column(
          children: [
            /// Email[E-posta]
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Icons.email), labelText: TTexts.email),
            ),
            const SizedBox(height: TSizes.spacebtwinputfields),

            /// Password[Şifre]
            TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validateEmptyText('Şifre', value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: TTexts.password,
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: TSizes.spacebtwinputfields / 2),

            /// Remember Me & Forget Password[Beni Hatırla ve Şifreni Unut]
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me[Beni Hatırla]
                Row(
                  children: [
                    Checkbox(value: controller.rememberMe.value, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                /// Forget Password[Şifreni Unut]
                TextButton(
                  onPressed: () => Get.to(
                    () => const ForgetPassword(),
                  ),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spacebtwsections),

            /// Sign In Button[Oturum Aç Düğmesi]
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spacebtwitems),

            /// Create Account Button[Hesap Oluştur Düğmesi]
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
