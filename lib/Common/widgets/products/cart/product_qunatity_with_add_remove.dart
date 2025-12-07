import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SProductQuantityWithAddAndRrmove extends StatelessWidget {
  const SProductQuantityWithAddAndRrmove({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return Row(
      children: [
        SCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: SSizes.iconSm,
          color: dark ? SColors.white : SColors.black,
          backgroundColor: dark
              ? SColors.darkerGrey
              : SColors.light,
        ),

        // SCircularIcon
        SizedBox(width: SSizes.spaceBtwItems),

        Text('2', style: Theme.of(context).textTheme.titleSmall),

        // Text
        SizedBox(width: SSizes.spaceBtwItems),

        // Added for spacing to the next button
        SCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: SSizes.iconSm,
          color: SColors.white,
          backgroundColor: SColors.primary,
        ),
      ],
    );
  }
}
