import 'package:e_commerce_app/Common/widgets/brand/brand_showcase.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/boxes_shimmer.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/brand/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            SListTileShimmer(),
            SizedBox(height: SSizes.spaceBtwItems),
            SBoxesShimmer(),
            SizedBox(height: SSizes.spaceBtwItems),
          ],
        ); // Column

        // Handle Loader, No Records,
        final widget = SCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          loader: loader,
        );
        if (widget != null) return widget;

        //Brand found
        final brands = snapshot.data!;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brand.id, limit: 3),
              builder: (context, snapshot) {
                // /// Handle Loader, No Records, Error
                final widget = SCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                ); // UCloudHelperFunctions -> SCloudHelperFunctions
                if (widget != null) return widget;

                // /// Products Found
                final products = snapshot.data!;

                return SBrandShowCase(
                  brand: brand,
                  images: products.map((product) => product.thumbnail).toList(),
                ); // UBrandShowcase -> SBrandShowcase
              },
            );
            // ... FutureBuilder
            // return  SBrandShowCase(brand: brand, images: [SImages.productImage47, SImages.productImage43, SImages.productImage7]);
            //
          },
        );
      }, // builder
    ); // FutureBuilder
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SBrandShowCase(
  //     images: [
  //       SImages.productImage43,
  //       SImages.productImage44,
  //       SImages.productImage45a,
  //     ],
  //   );
  // }
}
