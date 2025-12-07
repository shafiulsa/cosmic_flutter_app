import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';

import 'package:flutter/material.dart';


/* -- Light & Dark Elevated Button Themes -- */
class SElevatedButtonTheme {
  SElevatedButtonTheme._(); // To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: SColors.light,
      backgroundColor: SColors.primary,
      disabledForegroundColor: SColors.darkGrey,
      disabledBackgroundColor: SColors.buttonDisabled,
      side: const BorderSide(color: SColors.primary),
      padding: const EdgeInsets.symmetric(vertical: SSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: SColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: SColors.light,
      backgroundColor: SColors.primary,
      disabledForegroundColor: SColors.darkGrey,
      disabledBackgroundColor: SColors.darkerGrey,
      side: const BorderSide(color: SColors.primary),
      padding: const EdgeInsets.symmetric(vertical: SSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: SColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.buttonRadius)),
    ),
  );
}
