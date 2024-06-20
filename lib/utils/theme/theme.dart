import 'package:flutter/material.dart';
import 'package:shinex/utils/constants/colors.dart';

import 'package:shinex/utils/theme/custom_themes/appbar_theme.dart';
import 'package:shinex/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:shinex/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:shinex/utils/theme/custom_themes/chip_theme.dart';
import 'package:shinex/utils/theme/custom_themes/elevanted_button_theme.dart';
import 'package:shinex/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:shinex/utils/theme/custom_themes/text_field_theme.dart';
import 'package:shinex/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppinler',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppbarTheme.lightAppbarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevantedButtonTheme.lightElevantedButonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFromFieldTheme.lightTextFromFieldTheme,
  );
  static ThemeData dartTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppinler',
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.black,
    appBarTheme: TAppbarTheme.darkAppbarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevantedButtonTheme.darkElevantedButonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFromFieldTheme.darkTextFromFieldTheme,
  );
}
