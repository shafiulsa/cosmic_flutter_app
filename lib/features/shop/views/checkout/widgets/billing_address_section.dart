import 'package:e_commerce_app/Common/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/sizes.dart';

class SBillingAddresSection extends StatelessWidget {
  const SBillingAddresSection({super.key});

  @override
  Widget build(BuildContext context) {
 return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// [Text] - Billing Address
        SSectionHeading(title: 'Billing Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Unknown Pro', style: Theme.of(context).textTheme.bodyLarge),

        Row(
          children: [
            Icon(Icons.phone, size: SSizes.iconSm, color: SColors.darkGrey),
            SizedBox(width: SSizes.spaceBtwItems),
            Text('+92 312345678')
          ],
        ), // Row
    SizedBox(height: SSizes.spaceBtwItems/2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_history, size: SSizes.iconSm, color: SColors.darkGrey),
            SizedBox(width: SSizes.spaceBtwItems),
            Expanded(child: Text('House No.295, Hyderabad, Sindh, Pakistan',softWrap: true))
          ],
        ) // Row
      ],
    ); // Column
  }
}
