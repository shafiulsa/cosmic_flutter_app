import 'package:e_commerce_app/Common/widgets/text/brand_title_text.dart';
import 'package:e_commerce_app/utils/constans/enums.dart';
import 'package:flutter/material.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/sizes.dart';

class SBrandTitleWithVerifyIcon extends StatelessWidget {
  const SBrandTitleWithVerifyIcon({
    super.key,
    required this.title,
     this.maxlines=1,
    this.textColor,
    this.iconColor=SColors.primary,
    this.textAlign=TextAlign.center,
     this.brandTextSize=TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SBrandTitleText(
            title: title,
            maxLine: maxlines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
            color: textColor,
          ),
        ),
        SizedBox(width: SSizes.xs),
        Icon(Icons.verified, color: SColors.primary, size: SSizes.iconXs),
      ],
    );
  }
}
