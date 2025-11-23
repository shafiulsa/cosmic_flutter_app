import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/images/roundes_image.dart';
import 'package:e_commerce_app/Common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/utils/constans/enums.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

class SBrandCart extends StatelessWidget {
  const SBrandCart({super.key, this.showBorder = true});

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return SRoundedContainer(
      width: SSizes.brandCardWidth,
      height: SSizes.brandCardWidth,
      showBorder: showBorder,
      padding: EdgeInsets.all(SSizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          //Brand Image
          Flexible(
            child: SRoundedImage(
              imageUrl: SImages.adidasLogo,
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(width: SSizes.spaceBtwItems / 2),

          //Brand Name & verify Icon
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SBrandTitleWithVerifyIcon(
                  title: "Bata ggggggggggggggggggggggg",
                  brandTextSize: TextSizes.large,
                ),
                Text(
                  "172 productsdddddddddddddddddddddd",
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
