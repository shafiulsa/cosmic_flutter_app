import 'package:e_commerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/widgets/products/cart/cart_item.dart';
import '../../../../../Common/widgets/products/cart/product_qunatity_with_add_remove.dart';
import '../../../../../Common/widgets/text/product_price_text.dart';
import '../../../../../utils/constans/sizes.dart';

class SCartItems extends StatelessWidget {
  const SCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) =>
          SizedBox(height: SSizes.spaceBtwSections),
      itemCount: controller.cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Obx(() {
          final cartItem = controller.cartItems[index];
          return Column(
            children: [
              //Cart Icon
              SCartItem(cartItem: cartItem),
              if (showAddRemoveButton) SizedBox(height: SSizes.spaceBtwItems),

              /// Price, Counter Buttons
              if (showAddRemoveButton)
                Row(
                  children: [
                    // extra space
                    SizedBox(width: 70.0),

                    /// Quantity Buttons
                    SProductQuantityWithAddAndRrmove(
                      quantity: cartItem.quantity,
                      add: ()=> controller.addOneToCart(cartItem),
                      remove: ()=>controller.removeOneFromCart(cartItem),
                    ),

                    Spacer(),
                    // Product price
                    SProductPriceText(price: (cartItem.price*cartItem.quantity).toStringAsFixed(0)),
                  ],
                ), // Row
            ],
          );
        }); // Row
      },
    );
  }
}
