import 'package:e_commerce_app/Common/widgets/images/roundes_image.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/category/catrgory_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/views/all_products/all_products.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStoreCatagories extends StatelessWidget {
  const SearchStoreCatagories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Obx(() {
      // State: Loading
      if (controller.isCategoriesLoading.value)
        return Center(child: CircularProgressIndicator());

      // State: Empty
      if (controller.allCategories.isEmpty) return Text('No Categories Found!');

      // State: Data Found
      List<CategoryModel> categories = controller.allCategories.toList();

      return Column(
        children: [
          SSectionHeading(title: 'Categories', showActionButton: false),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              // i in for loop jamon 1 ta element tamon akta catagory ar jonna
              CategoryModel category = categories[index];
              return ListTile(
                onTap: () => (Get.to(
                  () => AllProductsScreen(
                    title: category.name,
                    futureMethod: controller.getCategoryProducts(
                      categoryId: category.id,
                    ),
                  ),
                )),
                contentPadding: EdgeInsets.zero,
                leading: SRoundedImage(
                  imageUrl: category.image,
                  borderRadius: 0,
                  width: SSizes.iconLg,
                  height: SSizes.iconLg,
                  isNetworkImage: true,
                ),
                title: Text(category.name),
              );
            },
          ),
        ],
      );
    });
  }
}
