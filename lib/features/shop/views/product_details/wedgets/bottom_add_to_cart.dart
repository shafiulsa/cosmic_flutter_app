import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SBottomAddToCart extends StatelessWidget {
  const SBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SSizes.defaultSpace,
        vertical: SSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? SColors.darkGrey : SColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SSizes.cardRadiusLg),
          topRight: Radius.circular(SSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          children: [
            //Decriment icon
            SCircularIcon(
              icon: Iconsax.minus,
              backgroundColor: SColors.darkGrey,
              width: 40,
              height: 40,
              color: SColors.white,
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.productQuantityInCart.value -= 1,
            ),
            SizedBox(width: SSizes.spaceBtwItems),

            // Counter
            Text(
              controller.productQuantityInCart.value.toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(width: SSizes.spaceBtwItems),

            //Incriment icon
            SCircularIcon(
              icon: Iconsax.add,
              backgroundColor: SColors.dark,
              width: 40,
              height: 40,
              color: SColors.white,
              onPressed: () => controller.productQuantityInCart.value += 1,
            ),
            Spacer(),

            /// Add to Cart Button
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product: product),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(SSizes.md),
                backgroundColor: SColors.black,
                side: BorderSide(color: SColors.black),
              ),

              child: Row(
                children: [
                  Icon(Iconsax.shopping_bag),
                  SizedBox(width: SSizes.spaceBtwItems / 2),
                  Text('Add To Cart'),
                ],
              ), // Row, ElevatedButton
            ),
          ],
        ),
      ),
    );
  }
}
