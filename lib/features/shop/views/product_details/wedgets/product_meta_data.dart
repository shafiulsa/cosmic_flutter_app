
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/images/circuler_image.dart';
import 'package:e_commerce_app/Common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/Common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/Common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/enums.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:flutter/material.dart';

class SProductMetaData extends StatelessWidget {
  const SProductMetaData({
    super.key, required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller= ProductController.instance;
    String? salePrecentage =controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      children: [
        // Sala,Tag,Salse priec,Actual Price and share icon
        Row(
          children: [
            //SEll tag
            if(salePrecentage !=null)...[
              SRoundedContainer(
                radius: SSizes.sm,
                backgroundColor: SColors.yellow.withValues(alpha: 0.8),
                padding: const EdgeInsets.symmetric(
                  horizontal: SSizes.sm,
                  vertical: SSizes.xs,
                ),
                child: Text(
                  '${salePrecentage}%',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: SColors.black),
                ),
              ),
              SizedBox(width: SSizes.spaceBtwItems),
            ],

            // Acutual Price
            if(product.productType==ProductType.single.toString() && product.salePrice>0)...[

              Text(
                '${SText.currency}${product.price.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: SSizes.spaceBtwItems),
            ],

            //Sele Price
            SProductPriceText(price: controller.getProductPrice(product), isLarge: true),
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
              controller.getProductStockStatus(product.stock),
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
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image :"",
              width: 32.0,
              height: 32.0,
              showBorder: true,
            ),
            SizedBox(width: SSizes.spaceBtwItems),
            SBrandTitleWithVerifyIcon(title: product.brand !=null ?product.brand!.name : ""),
          ],
        ),
      ],
    );
  }
}
