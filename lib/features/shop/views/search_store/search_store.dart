import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/Common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/views/search_store/widgets/search_store_brands.dart';
import 'package:e_commerce_app/features/shop/views/search_store/widgets/search_store_categories.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constans/sizes.dart';

class SearchStoreScreen extends StatelessWidget {
  const SearchStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxString searchText = ''.obs;
    return Scaffold(
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              // Search Field
              Hero(
                tag: 'serach_animation',
                child: Material(
                  color: Colors.transparent,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.search_normal),
                      hintText: 'Search in store',
                    ),
                    onChanged: (value) => searchText.value = value,
                  ),
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              Obx(() {
                if (searchText.value.isEmpty) {
                  return Column(
                    children: [
                      SearchStoreBrand(),

                      SizedBox(height: SSizes.spaceBtwSections),
                      // Categories
                      SearchStoreCatagories(),
                    ],
                  );
                }

                return FutureBuilder(
                  future: ProductController.instance.getAllProducts(),
                  builder: (context, snapshot) {
                    // Handle Loading, Error, Empty
                    final widget = SCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                    );
                    if (widget != null) return widget;

                    // Data Found - Products Found
                    final products = snapshot.data!;

                    final filteredProducts = products
                        .where(
                          (product) => product.title.toLowerCase().contains(
                            searchText.value.toLowerCase(),
                          ),
                        )
                        .toList();

                    return SGridLayout(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return SProductCartVertical(product: product);
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
