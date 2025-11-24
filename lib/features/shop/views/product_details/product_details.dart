import 'package:e_commerce_app/Common/style/padding.dart';
import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/views/product_details/wedgets/bottom_add_to_cart.dart';
import 'package:e_commerce_app/features/shop/views/product_details/wedgets/product_attribute.dart';
import 'package:e_commerce_app/features/shop/views/product_details/wedgets/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/views/product_details/wedgets/product_thumbnail_and_slider.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   ---------body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---[Product Image With Slider]----
            SProductThumnailAndSlider(), // Stack
            // ---------Prodcut Details
            Padding(
              padding: SPadding.screenPadding,
              child: Column(
                children: [
                  //Price,Title,Stack and Brand
                  SProductMetaData(),
                  SizedBox(height: SSizes.spaceBtwSections),
                  //Attribute
                  SProductAttributes(),
                  SizedBox(height: SSizes.spaceBtwSections),
                  //Checkout Button
                  SElevatedButton(onPress: () {}, child: Text('Check Out')),
                  SizedBox(height: SSizes.spaceBtwSections),
                  /// Description
                  SSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  SizedBox(height: SSizes.spaceBtwSections),

                  ReadMoreText(
                    'This is a product of iPhone 11 with 512 GB, This is a product of iPhone 11 with 512 GB, This is a product This is a product of iPhone 11 with 512 GB, This is a product of iPhone 11 with 512 GB, This is a product This is a product of iPhone 11 with 512 GB, This is a product of iPhone 11 with 512 GB, This is a product  of iPhone 11 with 512 GB...',
                    // Truncated text example
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ), // ReadMoreText
                  SizedBox(height: SSizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),

      ///---------Bottom Navigation Button
      bottomNavigationBar: SBottomAddToCart(),
    );
  }
}
