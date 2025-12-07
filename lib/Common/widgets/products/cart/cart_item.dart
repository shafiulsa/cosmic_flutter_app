import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constans/colors.dart';
import '../../../../utils/constans/images.dart';
import '../../../../utils/constans/sizes.dart';
import '../../images/roundes_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_title_text.dart';

class SCartItem extends StatelessWidget {
  const SCartItem({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return Row(
      children: [
        /// Product Image
        SRoundedImage(
          imageUrl: SImages.productImage4a,
          height: 60.0,
          width: 60.0,
          padding: EdgeInsets.all(SSizes.sm),
          backgroundColor: dark ? SColors.darkerGrey : SColors.light,
        ), // SRoundedImage
        SizedBox(width: SSizes.spaceBtwItems),

        /// Brand, Name, Variation
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Brand
              SBrandTitleWithVerifyIcon(title: 'iPhone'),

              /// Title
              SProductTitleText(
                title:
                'iPhone 11 64 GB W sdja skjbjkas djk askinajk nd jksa',
                maxLines: 1,
              ),

              /// Variation OR Attributes
              RichText(
                text: TextSpan(
                  children: [
                    // ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_const_literals_to_create_immutables, directives_ordering, file_names, avoid_unnecessary_containers
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Storage ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: '512GB ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ), // TextSpan
              ), // RichText
            ],
          ), // Column, Expanded
        ),
      ],
    );
  }
}
