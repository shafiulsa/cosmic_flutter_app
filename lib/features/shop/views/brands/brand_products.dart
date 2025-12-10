import 'package:e_commerce_app/Common/widgets/brand/brand_cart.dart';
import 'package:e_commerce_app/Common/widgets/products/sortable_products.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../Common/style/padding.dart';
import '../../../../Common/widgets/appbar/appbar.dart';

class BrandProductScreen extends StatelessWidget {
  const BrandProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBarr(showBackArrow: true, title: Text('Bata',style: Theme.of(context).textTheme.headlineSmall), ), // Assuming headlineSmall
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              SBrandCart(brand: BrandModel.empty(),),
              SizedBox(height: SSizes.spaceBtwSections),
              SSortAbleProducts(products: []),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
