import 'package:e_commerce_app/Common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/category/catrgory_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/views/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/views/store/widets/category_brands.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Common/widgets/layouts/grid_layout.dart';
import '../../../../../Common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../utils/constans/sizes.dart';

class SCatagoryTab extends StatelessWidget {
  const SCatagoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: category),
              SizedBox(height: SSizes.spaceBtwItems),
              // Section Heading
              SSectionHeading(
                title: "You Might like",
                showActionButton: true,
                onPressed: () => Get.to(
                  () => AllProductsScreen(
                    title: category.name,
                    futureMethod: controller.getCategoryProducts(
                      categoryId: category.id,
                      limit: -1,
                    ),
                  ),
                ),
              ),


              // Grid Layout Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {

                  // Handle Error, Loader and Empty States
                  const loader = SVerticalProductShimmer(itemCount: 4);
                  final widget = SCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  // Data Found
                  List<ProductModel> products = snapshot.data!;
                  return SGridLayout(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        ProductModel product = products[index];
                        return SProductCartVertical(
                          product: product,
                        ); // SProductCardVertical
                      }
                  ); // SGridLayout
                },
              ), // FutureBuilder

              // use space so the the last product dont touch the bottom bar
              SizedBox(height: SSizes.spaceBtwSections),
            ],
          ),
        ), // SRoundedContainer
      ],
    );
  }
}
