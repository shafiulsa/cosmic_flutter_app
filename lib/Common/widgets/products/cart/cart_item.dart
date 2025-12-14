import 'package:e_commerce_app/features/shop/models/cart_item_model.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/sizes.dart';
import '../../images/roundes_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_title_text.dart';

class SCartItem extends StatelessWidget {
  const SCartItem({
    super.key,
    required this.cartItem

  });

 final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return Row(
      children: [
        /// Product Image
        SRoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          height: 60.0,
          width: 60.0,
          padding: EdgeInsets.all(SSizes.sm),
          backgroundColor: dark ? SColors.darkerGrey : SColors.light,
        ), // SRoundedImage
        SizedBox(width: SSizes.spaceBtwItems),

        /// Brand, Name, Variation
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Brand
              SBrandTitleWithVerifyIcon(title: cartItem.brandName ?? ''),

              /// Title
              SProductTitleText(
                title:
                cartItem.title ?? '',
                maxLines: 1,
              ),

              /// Variation OR Attributes
              RichText(
                text: TextSpan(
                  children: (cartItem.selectedVariation?.entries.map((e) => TextSpan(
                      children: [
                        TextSpan(text: '${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  ))?.toList()) ?? [],
                ),
              )

            ],
          ), // Column, Expanded
        ),
      ],
    );
  }
}
