import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:flutter/material.dart';


class SChipTheme {
  SChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    // disabledColor: SColors.grey.withOpacity(0.4),
    disabledColor: SColors.grey.withAlpha((0.4 * 255).round()),

    labelStyle: const TextStyle(color: SColors.black),
    selectedColor: SColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: SColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: SColors.darkerGrey,
    labelStyle: TextStyle(color: SColors.white),
    selectedColor: SColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: SColors.white,
  );
}
