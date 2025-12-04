import 'package:e_commerce_app/Common/widgets/appbar/tab_bar.dart';
import 'package:e_commerce_app/Common/widgets/brand/brand_cart.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/brands_shimmer.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/brand/brand_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/category/catrgory_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/views/brands/all_brands.dart';
import 'package:e_commerce_app/features/shop/views/store/widets/category_tab.dart';
import 'package:e_commerce_app/features/shop/views/store/widets/sotre_primary_header.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: controller.featuredCategories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 340,
                pinned: true,
                floating: false,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///primary heading
                      SStorePrimaryHeader(),

                      SizedBox(height: SSizes.spaceBtwItems),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SSizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            // barand heading
                            SSectionHeading(
                              title: "Brand",
                              showActionButton: true,
                              onPressed: () => Get.to(() => BrandScreen()),
                            ),

                            // Brand Card
                            SizedBox(
                              height: SSizes.brandCardHeight,
                              child: Obx(() {
                                if (brandController.isLoading.value) {
                                  return SBrandsShimmer();
                                }
                                if (brandController.featuredBrands.isEmpty) {
                                  return Text('Brand Not found');
                                }
                                return ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: SSizes.spaceBtwItems),
                                  shrinkWrap: true,
                                  itemCount:
                                      brandController.featuredBrands.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    BrandModel brand =
                                        brandController.featuredBrands[index];
                                    return SizedBox(
                                      width: SSizes.brandCardWidth,
                                      child: SBrandCart(brand: brand),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Bottom a ja dibo ta scroll a appbar ar por stack hoya jabe
                bottom: STabBar(
                  tabs: controller.featuredCategories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: controller.featuredCategories
                .map((category) => SCatagoryTab())
                .toList(),
          ), // TabBarView
        ), // NestedScrollView
      ),
    ); // Scaffold
  }
}
