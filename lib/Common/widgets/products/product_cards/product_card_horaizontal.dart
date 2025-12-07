import 'package:e_commerce_app/Common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/Common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/Common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constans/images.dart';
import '../../custome_shape/rounded_container.dart';
import '../../icons/circuler_icon.dart';
import '../../images/roundes_image.dart';

class SProductCartHorizontal extends StatelessWidget {
  const SProductCartHorizontal({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SSizes.productImageRadius,
        ),
        color: dark ? SColors.darkerGrey : SColors.white,
      ),

      // BoxDecoration
      child: Row(
        children: [
          // Left Prtions
          SRoundedContainer(
            height: 120,
            padding: EdgeInsets.all(SSizes.sm),
            backgroundColor: dark ? SColors.dark : SColors.light,
            child: Stack(
              children: [
                // // / Thumbnail
                SizedBox(
                  width: 120,
                  height: 120,
                  child: SRoundedImage(
                    imageUrl: SImages.productImage15,
                    height: 120,
                  ),
                ),

                //discount tag
                Positioned(
                  top: 12.0,
                  child: SRoundedContainer(
                    radius: SSizes.sm,
                    backgroundColor: SColors.yellow.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: SSizes.sm,
                      vertical: SSizes.xs,
                    ),
                    child: Text(
                      '20%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: SColors.black),
                    ),
                  ),
                ),

                /// Favoirit icon
                Positioned(
                  right: 0,
                  top: 0,
                  child: SCircularIcon(
                    icon: Icons.heart_broken,
                    color: Colors.red,
                  ),
                ),

              ],
            ), // Stack
          ), // SRoundedContainer
          //  Right Portion
          SizedBox(
            width: 172.0,
            child: Padding(
              padding: const EdgeInsets.only(left: SSizes.sm, top: SSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //First Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Title
                      SProductTitleText(title: 'Blue Bata Shoes', smallSize: true),
                      SizedBox(height: SSizes.spaceBtwItems / 2),
                      // Product Brand
                      SBrandTitleWithVerifyIcon(title: 'Bata')
                    ],
                  ),

                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: SProductPriceText(price: '65')),
                      Container(
                        width: SSizes.iconLg * 1.2,
                        height: SSizes.iconLg * 1.2,
                        decoration: BoxDecoration(
                            color: SColors.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(SSizes.cardRadiusMd),
                              bottomRight: Radius.circular(SSizes.productImageRadius),
                            ) // BorderRadius.only
                        ), // BoxDecoration
                        child: Icon(Iconsax.add, color: SColors.white),
                      ) // Container
                    ],
                  ) // Row

                ],
              ), // Column
            ),
          ), // Padding
        ],
      ), // Row// Row
    );
  }
}
