import 'package:e_commerce_app/Common/widgets/image_text/image_text.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce_app/features/shop/controllers/category/catrgory_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/views/sub_category/sub_category.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SHomeCatagories extends StatelessWidget {
  const SHomeCatagories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // list of items
          SizedBox(height: SSizes.spaceBtwItems),

          // / Home Categories title
          Text(
            SText.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: SColors.white),
          ), // Text

          SizedBox(height: SSizes.spaceBtwItems),
          //Catagory view
          Obx(() {
            final categories = controller.featuredCategories;

            // loading
            if (controller.isCategoriesLoading.value) {
              // return CircularProgressIndicator();
              return SCategoryShimmer(itemCount: 6);
            }
            // [Empty]
            if (categories.isEmpty) {
              return Text("Category Not Found");
            }

            //Data found
            return SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: SSizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel catagory = categories[index];
                  return SVerticalImageText(
                    title: catagory.name,
                    image: catagory.image,
                    textColor: SColors.white,
                    onTap: () => Get.to(() => SubCategoryScreen()),
                  ); // Column
                },
              ), // ListView.builder
            );
          }), // SizedBox
        ],
      ),
    );
  }
}
