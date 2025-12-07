import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/brand/brand_cart.dart';
import 'package:e_commerce_app/Common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/brands_shimmer.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/brand/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/views/brands/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/style/padding.dart';
import '../../../../utils/constans/sizes.dart';

// class BrandScreen extends StatelessWidget {
//   const BrandScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = BrandController.instance;
//     return Scaffold(
//         appBar: SAppBarr(
//           showBackArrow: true,
//           title: Text('Brand', style: Theme
//               .of(context)
//               .textTheme
//               .headlineSmall),
//         ),
//         body: SingleChildScrollView(
//             child: Padding(
//                 padding: SPadding.screenPadding,
//                 child: Column(
//                     children: [
//                       //  [Text] - Brands
//                       SSectionHeading(title: 'Brands', showActionButton: false),
//                       SizedBox(height: SSizes.spaceBtwItems),
//                       // List Of Brands
//                       Obx(
//                               () {
//                             return SGridLayout(
//                               itemCount: controller.featuredBrands.length,
//                               itemBuilder: (context, index) {
//                                 return SBrandCart(
//                                     onTap: () =>
//                                         Get.to(() => BrandProductScreen()),
//                                     brand: BrandModel.empty());
//                               },
//                               mainAxisExtent: 80,
//                             );
//                           }
//                       )
//                     ]
//
//
//
//   ),
//
//   ), // Column
//   ), // Padding
//   ), // SingleChildScrollView
//   ); // Scaffold
// }}
class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              // [Text] - Brands
              SSectionHeading(title: 'Brands', showActionButton: false),

              SizedBox(height: SSizes.spaceBtwItems),

              // List of Brands
              Obx(() {
                //    [Loading] state
                if (controller.isLoading.value) {
                  return SBrandsShimmer();
                }
                // Empty state
                if (controller.featuredBrands.isEmpty) {
                  return Text('Brand Not found');
                }
                // Data Found state
                return SGridLayout(
                  itemCount: controller.featuredBrands.length,
                  itemBuilder: (context, index) {
                    BrandModel brand = controller.allBrands[index];
                    return SBrandCart(
                      onTap: () => Get.to(() => BrandProductScreen()),
                      brand: brand,
                    );
                  },
                  mainAxisExtent: 80,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
