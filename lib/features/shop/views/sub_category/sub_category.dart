import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/products/product_cards/product_card_horaizontal.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/category/catrgory_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/views/all_products/all_products.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/style/padding.dart';
import '../../../../utils/constans/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              // Fetch Sub-categry for category
              FutureBuilder(
                future: controller.getSubCategory(categoryId: category.id),
                builder: (context, snapshot) {

                  //handle loading,Error,Empty
                  const loader=SHorizontalProductShimmer();
                  final widget = SCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader
                  );
                  if (widget != null) {
                    return widget;
                  }
                  //Data Found -Subcatagory found
                  List<CategoryModel> subCategores = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategores.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      CategoryModel subCategory = subCategores[index];

                     // Fetch Products for Subcategory
                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {
                          //handle loading,Error,Empty
                          final widget = SCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: loader
                          );
                          if (widget != null) {
                            return widget;
                          }
                          //Data Found -Subcatagory found
                          List<ProductModel> products = snapshot.data!;


                          return Column(
                            children: [
                              // // / Sub Category
                              SSectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(()=>AllProductsScreen(title: subCategory.name,futureMethod: controller.getCategoryProducts(categoryId: subCategory.id ,limit: -1),)),
                              ),
                              SizedBox(height: SSizes.spaceBtwItems / 2),
                              // // / Horizontal Product Card
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: SSizes.spaceBtwItems),
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    ProductModel product=products[index];
                                    return SProductCartHorizontal(product: product);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
