
import 'package:e_commerce_app/Common/style/shadow.dart';
import 'package:e_commerce_app/features/shop/views/search_store/search_store.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class USearchBar extends StatelessWidget {
  const USearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return Positioned(
      bottom: 0,
      right: SSizes.spaceBtwSections,
      left: SSizes.spaceBtwSections,
      child:  GestureDetector(
        onTap: ()=> Get.to(SearchStoreScreen()),
        child: Container(
              height: SSizes.searchBarHeight,
              padding: EdgeInsets.symmetric(horizontal: SSizes.md),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SSizes.borderRadiusLg),
                  color: dark ? SColors.light : SColors.dark,
                  boxShadow: SShadow.searchBarShadow
              ),
              child: Row(
                children: [
        
                  /// Search Icon
                  Icon(Iconsax.search_normal, color: dark ? SColors.dark : SColors.light),
                  SizedBox(width: SSizes.spaceBtwItems),
        
                  /// Search Bar Title
                  // Text(SText.searchBarTitle, style: Theme.of(context).textTheme.bodySmall, color: dark ? SColors.dark : SColors.light)
                  Text(
                    SText.searchBarTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: dark ? SColors.dark : SColors.light,
                    ),
                  )
        
                ],
              ),
        
        ),
      ),
    )
    ;
  }
}
