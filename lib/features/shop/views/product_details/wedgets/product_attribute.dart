import 'package:e_commerce_app/Common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/Common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SProductAttributes extends StatelessWidget {
  const SProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Column(
      children: [
        // Selected Attribute Prices & Description
        SRoundedContainer(
          padding: EdgeInsets.all(SSizes.md),
          backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title ,price & stock
              Row(
                children: [
                  // [Text] -Variation Heading
                  SSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  SizedBox(width: SSizes.spaceBtwItems),

                  Column(
                    children: [
                      /// Price ,Sale price, Actual Price
                      Row(
                        children: [
                          /// [Text] - Price
                          SProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          // Actual Price
                          Text(
                            '250',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),

                          SizedBox(width: SSizes.spaceBtwItems),
                          // Sell Price
                          SProductPriceText(price: '200'),
                        ],
                      ),

                      /// Stock Status
                      Row(
                        children: [
                          SProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ), // Row
                    ],
                  ), // Column
                ],
              ), // Row
              // Atribute description
              SProductTitleText(
                title: "this is the product fom iPhone ",
                smallSize: true,
              ),
            ],
          ), // Column
        ), // SRoundedContainer
        SizedBox(height: SSizes.spaceBtwItems),


        // Attributes -Colors
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SSectionHeading(title: 'Color', showActionButton: false),
            SizedBox(height: SSizes.spaceBtwItems / 2),

            Wrap(
              spacing: SSizes.sm,
              children: [
                SChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
                SChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                SChoiceChip(
                  text: 'Orange',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),




        // Attributes -Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SSectionHeading(title: 'Sizes', showActionButton: false),
            SizedBox(height: SSizes.spaceBtwItems / 2),

            Wrap(
              spacing: SSizes.sm,
              children: [
                SChoiceChip(
                  text: 'Small',
                  selected: false,
                  onSelected: (value) {},
                ),
                SChoiceChip(
                  text: 'Medium',
                  selected: false,
                  onSelected: (value) {},
                ),
                SChoiceChip(
                  text: 'Large',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    ); // Column
  }
}
