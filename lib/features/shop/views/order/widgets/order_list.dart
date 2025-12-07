import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/widgets/custome_shape/rounded_container.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/sizes.dart';

class SOrderslistItems extends StatelessWidget {
  const SOrderslistItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(height: SSizes.spaceBtwItems),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SRoundedContainer(
          showBorder: true,
          backgroundColor: dark ? SColors.dark : SColors.light,
          padding: EdgeInsets.all(SSizes.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // // / 1 - Row
              Row(
                children: [
                  Icon(Iconsax.ship),
                  SizedBox(width: SSizes.spaceBtwItems / 2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: SColors.textPrimary,
                          ),
                        ),
                        // Assuming UColors.textPrimary -> SColors.textPrimary
                        Text(
                          '01 Jan 2025',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_right_34, size: SSizes.iconSm),
                  ),
                  // Column
                ],
              ), // Row

              SizedBox(height: SSizes.spaceBtwItems),
              //  2 - Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order Details
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(width: SSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              // Assuming UColors.textPrimary -> SColors.textPrimary
                              Text(
                                '#sdf23232',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //shippind Data
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.calendar),
                        SizedBox(width: SSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              // Assuming UColors.textPrimary -> SColors.textPrimary
                              Text(
                                '12 june 2025',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), // Row
            ],
          ),
        ); // SRoundedContainer
      },
    );
  }
}
