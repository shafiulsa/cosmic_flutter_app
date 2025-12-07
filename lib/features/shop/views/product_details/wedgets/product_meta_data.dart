
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/images/circuler_image.dart';
import 'package:e_commerce_app/Common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/Common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/Common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

class SProductMetaData extends StatelessWidget {
  const SProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sala,Tag,Salse priec,Actual Price and share icon
        Row(
          children: [
            //SEll tag
            SRoundedContainer(
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
            SizedBox(width: SSizes.spaceBtwItems),
            // Sell Price
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: SSizes.spaceBtwItems),

            //Actuall Price
            SProductPriceText(price: '150', isLarge: true),
            Spacer(),

            // Share button
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems / 1.5),
        ////Product Title
        SProductTitleText(title: "Apple iPhone"),
        SizedBox(height: SSizes.spaceBtwItems / 1.5),

        /// Product Status
        Row(
          children: [
            SProductTitleText(title: "Status"),
            SizedBox(width: SSizes.spaceBtwItems),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems / 1.5),

        // product Barand and Image with title
        Row(
          children: [
            SCircularImage(
              padding: 0,
              image: SImages.appleLogo,
              width: 32.0,
              height: 32.0,
              showBorder: true,
            ),
            SizedBox(width: SSizes.spaceBtwItems),
            SBrandTitleWithVerifyIcon(title: " Apple"),
          ],
        ),
      ],
    );
  }
}
