import 'package:e_commerce_app/Common/widgets/brand/brand_cart.dart';
import 'package:e_commerce_app/Common/widgets/products/sortable_products.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/brand/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../Common/style/padding.dart';
import '../../../../Common/widgets/appbar/appbar.dart';

class BrandProductScreen extends StatelessWidget {
  const BrandProductScreen({super.key, required this.title, required this.brand});

  final String title;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      appBar: SAppBarr(showBackArrow: true, title: Text(title,style: Theme.of(context).textTheme.headlineSmall), ), // Assuming headlineSmall
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              //Brand
              SBrandCart(brand: brand),
              SizedBox(height: SSizes.spaceBtwSections),


              FutureBuilder(
                future: controller.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  /// Handle Loading, Error And Empty States
                  const loader = SVerticalProductShimmer();
                  Widget? widget = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Brand Product
                  List<ProductModel> products = snapshot.data!;
                  return SSortAbleProducts(products: products);
                }
              ),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
