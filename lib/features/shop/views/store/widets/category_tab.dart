import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../Common/widgets/brand/brand_showcase.dart';
import '../../../../../Common/widgets/layouts/grid_layout.dart';
import '../../../../../Common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../utils/constans/images.dart';
import '../../../../../utils/constans/sizes.dart';

class SCatagoryTab extends StatelessWidget {
  const SCatagoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Showcas 1
              SBrandShowCase(
                images: [
                  SImages.productImage43,
                  SImages.productImage44,
                  SImages.productImage45a,
                ],
              ),
              // Brand Showcas
              SBrandShowCase(
                images: [
                  SImages.productImage43,
                  SImages.productImage44,
                  SImages.productImage45a,
                ],
              ),

              SizedBox(height: SSizes.spaceBtwItems),
              // Section Heading
              SSectionHeading(
                title: "You Might like",
                showActionButton: true,
                onPressed: () {},
              ),

              // Grid Layout of Product
              SGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return SProductCartVertical(product: ProductModel.empty());
                },
              ),

              // use space so the the last product dont touch the bottom bar
              SizedBox(height: SSizes.spaceBtwSections,)
            ],
          ),
        ), // SRoundedContainer
      ],
    );
  }
}
