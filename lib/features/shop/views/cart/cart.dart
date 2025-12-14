import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/Common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app/features/shop/views/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/views/checkout/checkout.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constans/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    return Scaffold(
      /// -----[Appbar]-----
        appBar: SAppBarr(
          showBackArrow: true,
          title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            SCircularIcon(
              icon: Iconsax.box_remove,
              onPressed: () => controller.clearCart(),
            ),
          ],
        ),

        /// -----[Body]-----
        body: Obx(() {

          final emptyWidget = SAnimationLoader(
            text: 'Cart is empty',
            animation: SImages.cartEmptyAnimation,
            showActionButton: true,
            actionText: "Let's fill it",
            onPressed: () => Get.back(),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          }


          return SingleChildScrollView(
            child: Padding(
              padding: SPadding.screenPadding,
              child: SCartItems(),
            ),
          ); // Padding
        }), // Obx


    /// -----[Botoom Navigation]-----
      bottomNavigationBar: Obx(
          (){
            if(controller.cartItems.isEmpty) return SizedBox();
            return  Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: SElevatedButton(onPress: ()=>Get.to(()=>CheckOutScreen()),child: Text("Chequeout \$${SText.currency}${controller.totalCartPrice.value.toStringAsFixed(2)}")),
            );
          }
      ),

    );
  }
}

