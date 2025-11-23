import 'package:e_commerce_app/Common/style/shadow.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/Common/widgets/images/roundes_image.dart';
import 'package:e_commerce_app/Common/widgets/text/brand_title_text.dart';
import 'package:e_commerce_app/Common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/Common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/Common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/enums.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constans/sizes.dart';

class SProductCartVertical extends StatelessWidget {
  const SProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: SShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(SSizes.productImageRadius),
          color: dark ? SColors.darkGrey : SColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail ,Favourite button, Discopunt Tag
            SRoundedContainer(
              width: 180,
              padding: const EdgeInsets.all(SSizes.sm),
              backgroundColor: dark ? SColors.dark : SColors.light,
              child: Stack(
                children: [
                  //Thumbnail
                  SRoundedImage(imageUrl: SImages.productImage15),
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
              ),
            ),
            SizedBox(height: SSizes.spaceBtwItems / 2),
            // Details
            Padding(
              padding: const EdgeInsets.only(left: SSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Title
                  const SProductTitleText(
                    title: 'Blue Bata Shoes',
                    smallSize: true,
                  ),
                  SizedBox(height: SSizes.spaceBtwItems / 2),

                  /// Product Brand
                  SBrandTitleWithVerifyIcon(title: "Bata",), // Row
                ],
              ),
            ),
            Spacer(),

            /// Product Price & add button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Product price
                SProductPriceText(price: '20'),

                // Add button
                Container(
                  width: SSizes.iconLg * 1.2,
                  height: SSizes.iconLg * 1.2,
                  decoration: BoxDecoration(
                    color: SColors.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(SSizes.cardRadiusMd),
                      bottomRight: Radius.circular(SSizes.productImageRadius),
                    ), // BorderRadius.only
                  ), // BoxDecoration
                  child: const Icon(Icons.add, color: SColors.white),
                ), // Container
              ],
            ), // Row
          ],
        ),
      ),
    );
  }
}

