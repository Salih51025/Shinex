import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinex/common/styles/spacing_styles.dart';
import 'package:shinex/common/widgets/login_signup/from_divider.dart';
import 'package:shinex/common/widgets/login_signup/social_buttons.dart';
import 'package:shinex/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shinex/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shinex/utils/constants/sizes.dart';
import 'package:shinex/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Header[Başlık ve Logo, Alt Başlık]
              const TLoginHeader(),

              /// Form
              const TLoginFrom(),

              /// Dvider[Bölücü]
              TFromDvider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spacebtwsections),

              /// Foother[Altbilgi]
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
