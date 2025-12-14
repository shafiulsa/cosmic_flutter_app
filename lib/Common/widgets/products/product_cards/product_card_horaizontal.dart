import 'package:e_commerce_app/Common/widgets/button/add_to_cart_button.dart';
import 'package:e_commerce_app/Common/widgets/products/favourite/favourite_icon.dart';
import 'package:e_commerce_app/Common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/Common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/Common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/views/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../custome_shape/rounded_container.dart';
import '../../images/roundes_image.dart';

class SProductCartHorizontal extends StatelessWidget {
  const SProductCartHorizontal({
    super.key, required this.product,

  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final controller =ProductController.instance;
    String? saleParcentage =controller.calculateSalePercentage(product.price, product.salePrice);

    return GestureDetector(
      onTap: ()=> Get.to(()=>ProductDetailsScreen(product: product)),
      child: Container(
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
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                      height: 120,
                    ),
                  ),

                  //discount tag
                  if(saleParcentage!=null)
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
                        '${saleParcentage}%',
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
                    child: SFavouriteIcon(productId: product.id)
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
                        SProductTitleText(title: product.title, smallSize: true),
                        SizedBox(height: SSizes.spaceBtwItems / 2),
                        // Product Brand
                        SBrandTitleWithVerifyIcon(title: product.brand!.name)
                      ],
                    ),

                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Product Price
                        Flexible(child: SProductPriceText(price: controller.getProductPrice(product))),

                        //Add button
                       ProductAddToCartButton(product: product)
                      ],
                    ) // Row

                  ],
                ), // Column
              ),
            ), // Padding
          ],
        ), // Row// Row
      ),
    );
  }
}
