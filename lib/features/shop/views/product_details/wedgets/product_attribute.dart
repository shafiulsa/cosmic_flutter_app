import 'package:e_commerce_app/Common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/text/product_price_text.dart';
import 'package:e_commerce_app/Common/widgets/text/product_title_text.dart';
import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SProductAttributes extends StatelessWidget {
  const SProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        ()=> Column(
        children: [
          // Selected Attribute Prices & Description
          if(controller.selectedVariation.value.id.isNotEmpty)
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
                    SSectionHeading(title: 'Variation', showActionButton: false),
                    SizedBox(width: SSizes.spaceBtwItems),

                    Column(
                      children: [
                        /// Price ,Sale price, Actual Price
                        Row(
                          children: [
                            /// [Text] - Price
                            SProductTitleText(title: 'Price : ', smallSize: true),
                            // Actual Price
                            if(controller.selectedVariation.value.salePrice>0)
                            Text(
                              '${SText.currency}${controller.selectedVariation.value.price.toStringAsFixed(0)}',
                              style: Theme.of(context).textTheme.titleSmall!
                                  .apply(decoration: TextDecoration.lineThrough),
                            ),

                            SizedBox(width: SSizes.spaceBtwItems),
                            // Sell Price
                            SProductPriceText(price: controller.getVeriationPrice()),
                          ],
                        ),

                        /// Stock Status
                        Row(
                          children: [
                            SProductTitleText(title: 'Stock : ', smallSize: true),
                            Text(
                              '${controller.variationStockStatus.value}',
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
            children: product.productAttributes!.map((attribute) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SSectionHeading(
                    title: attribute.name ?? '',
                    showActionButton: false,
                  ),
                  SizedBox(height: SSizes.spaceBtwItems / 2),

                  Obx(
                    () => Wrap(
                      spacing: SSizes.sm,
                      children: attribute.values!.map((attributeValue) {
                        bool isSelected =
                            controller.selectedAttributes[attribute.name] ==
                            attributeValue;
                        // bool available= controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);
                        bool available = controller
                            .getAttributesAvailabilityInVariation(
                              product.productVariations!,
                              attribute.name!,
                            )!
                            .contains(attributeValue);
                        return SChoiceChip(
                          text: attributeValue,
                          selected: isSelected,

                          onSelected: available
                              ? (selected) {
                                  if (available && selected) {
                                    controller.onAttributeSelected(
                                      product,
                                      attribute.name,
                                      attributeValue,
                                    );
                                  }
                                }
                              : null,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    ); // Column
  }
}
