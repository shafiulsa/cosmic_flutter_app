import 'package:e_commerce_app/Common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/Common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SSortAbleProducts extends StatelessWidget {
  const SSortAbleProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = AllProductsController.instance;
    controller.assignProducts(products);
    return Column(
      children: [
        //Filter Field
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) => controller.sortProducts(value as String),
          items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest'].map((
            filter,
          ) {
            return DropdownMenuItem(value: filter, child: Text(filter));
          }).toList(),
        ), // DropdownButtonFormField
        SizedBox(height: SSizes.spaceBtwSections),

        // Products
        Obx(
          () => SGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (context, index) =>
                SProductCartVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
