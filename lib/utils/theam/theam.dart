import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/theam/widgets_theam/appbar_theme.dart';
import 'package:e_commerce_app/utils/theam/widgets_theam/bottom_sheet_theme.dart';
import 'package:e_commerce_app/utils/theam/widgets_theam/checkbox_theme.dart';
import 'package:e_commerce_app/utils/theam/widgets_theam/chip_theme.dart';
import 'package:e_commerce_app/utils/theam/widgets_theam/elevated_button_theme.dart';
import 'package:e_commerce_app/utils/theam/widgets_theam/outlined_button_theme.dart';
import 'package:e_commerce_app/utils/theam/widgets_theam/text_field_theme.dart';
import 'package:e_commerce_app/utils/theam/widgets_theam/text_theme.dart';
import 'package:flutter/material.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    disabledColor: SColors.grey,
    brightness: Brightness.light,
    primaryColor: SColors.primary,
    textTheme: STextTheme.lightTextTheme,
    chipTheme: SChipTheme.lightChipTheme,
    scaffoldBackgroundColor: SColors.white,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    checkboxTheme: SCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: SBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    disabledColor: SColors.grey,
    brightness: Brightness.dark,
    primaryColor: SColors.primary,
    textTheme: STextTheme.darkTextTheme,
    chipTheme: SChipTheme.darkChipTheme,
    scaffoldBackgroundColor: SColors.black,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    checkboxTheme: SCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: SBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme,
  );
}
