import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SSingleAddress extends StatelessWidget {
  const SSingleAddress({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SRoundedContainer(
      width: double.infinity,
      showBorder: true,
      borderColor: isSelected ? Colors.transparent : SColors.primary,
      backgroundColor: isSelected
          ? SColors.primary.withValues(alpha: 0.5)
          : Colors.transparent,
      padding: EdgeInsets.all(SSizes.md),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name
              Text(
                'Unknown Pro',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: SSizes.spaceBtwItems / 2),

              /// Phone Number
              Text(
                '+92 312345678',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: SSizes.spaceBtwItems / 2),

              /// Address
              Text(
                'House No.295, Hyderabad, Sindh, Pakistan',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          if (isSelected)
            Positioned(
              top: 0,
              bottom: 0,
              right: 6,
              child: Icon(Iconsax.tick_circle5),
            ),
        ],
      ), // Column
    );
  }
}
