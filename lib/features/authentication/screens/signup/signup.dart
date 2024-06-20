import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/widgets/login_signup/from_divider.dart';
import 'package:shinex/common/widgets/login_signup/social_buttons.dart';
import 'package:shinex/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/constants/text_strings.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultspace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title[Başlık]
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spacebtwsections),

              /// Form[Biçim]
              const TSignupForm(),
              const SizedBox(height: TSizes.spacebtwsections),

              /// Divider[Bölücü]
              TFromDvider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spacebtwsections),

              /// Social Buttons[Sosyal Düğmeler]
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
