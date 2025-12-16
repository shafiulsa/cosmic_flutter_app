import 'package:e_commerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constans/sizes.dart';

class SBillingAmountSecton extends StatelessWidget {
  const SBillingAmountSecton({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController= CartController.instance;
    final subtotal=cartController.totalCartPrice.value;
    return Column(
      children: [
        /// Amount
        Column(
          children: [
            //Subtotal
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Text('${SText.currency}$subtotal', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ), // Row

            SizedBox(height: SSizes.spaceBtwItems / 2),
            // Shipping fee
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Shipping Fee',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Text('${SText.currency}${SPricingCalculator.calculateShippingCost(subtotal,'Bsangladesh')}', style: Theme.of(context).textTheme.labelLarge),
              ],
            ), // Row
            SizedBox(height: SSizes.spaceBtwItems / 2),
            //Tax fee
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tax Fee',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                Text('${SText.currency}${SPricingCalculator.calculateTax(subtotal, 'Bangladesh')}', style: Theme.of(context).textTheme.labelLarge),
              ],
            ), // Row
            SizedBox(height: SSizes.spaceBtwItems / 2),


            //Order total
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Odere Total',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Text('${SText.currency}${SPricingCalculator.calculateTotalPrice(subtotal, 'Bangladesh')}', style: Theme.of(context).textTheme.titleMedium),
              ],
            ), // Row
          ],
        ), // Column
      ],
    );
  }
}
