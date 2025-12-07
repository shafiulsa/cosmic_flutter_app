import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/shop/views/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/views/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constans/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -----[Appbar]-----
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),

      /// -----[Body]-----
      body: Padding(
        padding: SPadding.screenPadding,
        child: SCartItems(),
      ),

      /// -----[Botoom Navigation]-----
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: SElevatedButton(onPress: ()=>Get.to(()=>CheckOutScreen()),child: Text("Chequeout \$121223")),
      ),

    );
  }
}

