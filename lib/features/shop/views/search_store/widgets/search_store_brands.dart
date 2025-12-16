import 'package:e_commerce_app/Common/widgets/image_text/image_text.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/brand/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/views/brands/all_brands.dart';
import 'package:e_commerce_app/features/shop/views/brands/brand_products.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStoreBrand extends StatelessWidget {
  const SearchStoreBrand({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    final dark = SHelperFunction.isDarkMode(context);
    return Obx(() {
      // State: Loading
      if (controller.isLoading.value)
        return Center(child: CircularProgressIndicator());

      // State: Empty
      if (controller.allBrands.isEmpty) return Text('No Brands Found!');

      // State: Data Found
      List<BrandModel> brands = controller.allBrands.take(10).toList();
      return Column(
        children: [
          SSectionHeading(title: 'Brands',onPressed: ()=>Get.to(BrandScreen())),
          SizedBox(height: SSizes.spaceBtwItems),
          Wrap(
            spacing: SSizes.spaceBtwItems,
            runSpacing: SSizes.spaceBtwItems,
            children: brands
                .map(
                  (brand) => SVerticalImageText(
                    onTap: ()=>Get.to(()=>BrandProductScreen(title: brand.name, brand: brand)),
                    title: brand.name,
                    image: brand.image,
                    textColor: dark ? SColors.white : SColors.black,
                  ),
                )
                .toList(),
          ),
        ],
      );
    });
  }
}
