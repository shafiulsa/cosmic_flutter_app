import 'package:flutter/material.dart';

import '../../../../../Common/widgets/products/cart/cart_item.dart';
import '../../../../../Common/widgets/products/cart/product_qunatity_with_add_remove.dart';
import '../../../../../Common/widgets/text/product_price_text.dart';
import '../../../../../utils/constans/sizes.dart';

class SCartItems extends StatelessWidget {
  const SCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          SizedBox(height: SSizes.spaceBtwSections),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            //Cart Icon
            SCartItem(),
            if (showAddRemoveButton) SizedBox(height: SSizes.spaceBtwItems),

            /// Price, Counter Buttons
            if (showAddRemoveButton)
              Row(
                children: [
                  // extra space
                  SizedBox(width: 70.0),

                  /// Quantity Buttons
                  SProductQuantityWithAddAndRrmove(),

                  Spacer(),
                  // Product price
                  SProductPriceText(price: '232'),
                ],
              ), // Row
          ],
        ); // Row
      },
    );
  }
}
