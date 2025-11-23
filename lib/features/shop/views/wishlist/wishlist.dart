import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/Common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/Common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBarr(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          SCircularIcon(
            icon: Icons.add,
            onPressed: () =>
                NavigationController.intance.selectedIndex.value = 0,
          ),
        ],
      ),
  
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: SGridLayout(itemCount: 6, itemBuilder: (context, index)=>SProductCartVertical(),),
        ),
      ),
    );
  }
}
