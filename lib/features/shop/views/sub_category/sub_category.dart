import 'package:e_commerce_app/Common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/icons/circuler_icon.dart';
import 'package:e_commerce_app/Common/widgets/images/roundes_image.dart';
import 'package:e_commerce_app/Common/widgets/products/product_cards/product_card_horaizontal.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../Common/style/padding.dart';
import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: SAppBarr(
        showBackArrow: true,
        title: Text(
          'Sports',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SPadding.screenPadding,
          child: Column(
            children: [
              // // / Sub Category
              SSectionHeading(title: 'Sports Shoes', onPressed: () {}),
              SizedBox(height: SSizes.spaceBtwItems / 2),
              // // / Horizontal Product Card
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(width: SSizes.spaceBtwItems),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SProductCartHorizontal();
                  },
                ),
              ),

            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
