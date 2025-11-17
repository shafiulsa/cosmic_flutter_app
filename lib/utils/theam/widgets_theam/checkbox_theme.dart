import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

/// Custom Class for Light & Dark Checkbox Themes
class SCheckboxTheme {
  SCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Checkbox Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return SColors.white;
      } else {
        return SColors.black;
      }
    }),
    fillColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return SColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
    // fillColor: MaterialStateColor.resolveWith((states) {
    //   if (states.contains(WidgetState.selected)) {
    //     return SColors.primary;
    //   } else {
    //     return Colors.transparent;
    //   }
    // }),
  );

  /// Customizable Dark Checkbox Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return SColors.white;
      } else {
        return SColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return SColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
