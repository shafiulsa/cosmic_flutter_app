import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constans/colors.dart';
import '../../../utils/constans/sizes.dart';
import '../custome_shape/rounded_container.dart';

class SPromoCodeField extends StatelessWidget {
  const SPromoCodeField({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return SRoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.only(
        left: SSizes.md,
        top: SSizes.sm,
        right: SSizes.sm,
        bottom: SSizes.sm,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ), // InputDecoration
            ), // TextFormField, Flexible
          ),

          SizedBox(
            width: 80.0,
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.2), // Using withOpacity for clarity
                  foregroundColor: dark
                      ? SColors.white.withOpacity(0.5)
                      : SColors.dark.withOpacity(0.5), // Corrected withValues to withOpacity and assumed alpha 0.5 was intended
                  side: BorderSide(color: Colors.grey.withOpacity(0.1)) // Using withOpacity for clarity
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ), // Row
    );
  }
}
