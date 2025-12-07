import 'package:flutter/material.dart';

import '../../../../../utils/constans/sizes.dart';

class SBillingAmountSecton extends StatelessWidget {
  const SBillingAmountSecton({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text('\$343', style: Theme.of(context).textTheme.bodyMedium),
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
                Text('\$34', style: Theme.of(context).textTheme.labelLarge),
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

                Text('\$34', style: Theme.of(context).textTheme.labelLarge),
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
                Text('\$34', style: Theme.of(context).textTheme.titleMedium),
              ],
            ), // Row
          ],
        ), // Column
      ],
    );
  }
}
