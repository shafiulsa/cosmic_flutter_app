import 'package:e_commerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app/features/shop/models/cart_item_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/views/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/enums.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddToCartButton extends StatelessWidget {
  const ProductAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return InkWell(
        onTap: () {
          if (product.productType == ProductType.single.toString()) {
            CartItemModel cartItem = controller.convertToCartItem(product, 1);
            controller.addOneToCart(cartItem);
          } else {
            Get.to(() => ProductDetailsScreen(product: product));
          }
        },

        child: Obx(() {
        int productQuantityInCart = controller.getProductQuantityInCart(
          product.id,
        );
        return Container(
          width: SSizes.iconLg * 1.2,
          height: SSizes.iconLg * 1.2,
          decoration: BoxDecoration(
            color: productQuantityInCart>0 ? SColors.dark : SColors.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(SSizes.cardRadiusMd),
              bottomRight: Radius.circular(SSizes.productImageRadius),
            ), // BorderRadius.only
          ), // BoxDecoration
          child: Center(
            child: productQuantityInCart > 0
                ? Text(
                    productQuantityInCart.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.apply(color: SColors.white),
                  )
                : Icon(Icons.add, color: SColors.white),
          ),
        );
      }),
    );
  }
}
