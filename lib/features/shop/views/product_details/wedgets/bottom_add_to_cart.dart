import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SBottomAddToCart extends StatelessWidget {
  const SBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark=SHelperFunction.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SSizes.defaultSpace,
        vertical: SSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? SColors.darkGrey:SColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SSizes.cardRadiusLg),
          topRight: Radius.circular(SSizes.cardRadiusLg),
        )
      ),
      child: Row(
        children: [
          //Decriment icon
          SCircularIcon(
            icon: Iconsax.minus,
            backgroundColor: SColors.darkGrey,
            width: 40,
            height: 40,
            color: SColors.white,
          ),
          SizedBox(width: SSizes.spaceBtwItems),

          // Counter
          Text('2', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(width: SSizes.spaceBtwItems),


          //Incriment icon
          SCircularIcon(
            icon: Iconsax.add,
            backgroundColor: SColors.dark,
            width: 40,
            height: 40,
            color: SColors.white,
          ),
          Spacer(),
          /// Add to Cart Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(SSizes.md),
                backgroundColor: SColors.black,
                side: BorderSide(color: SColors.black)
            ),

            child: Row(
              children: [
                Icon(Iconsax.shopping_bag),
                SizedBox(width: SSizes.spaceBtwItems / 2),
                Text('Add To Cart'),
              ],
            ), // Row, ElevatedButton
          )
        ],
      ),
    );
  }
}
