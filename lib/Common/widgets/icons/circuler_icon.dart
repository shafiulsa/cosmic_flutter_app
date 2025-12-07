import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:flutter/material.dart';
import '../../../utils/constans/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SCircularIcon extends StatelessWidget {
  const SCircularIcon({
    super.key,
    required this.icon,
    this.size = SSizes.iconMd,
    this.backgroundColor,
    this.onPressed,
    this.height,
    this.width,
    this.color,
  });

  final double? width, height, size;
  final IconData? icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: (backgroundColor != null)
              ? backgroundColor
              : dark
              ? SColors.dark.withValues(alpha: 0.9)
              : SColors.light.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(1000)),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
