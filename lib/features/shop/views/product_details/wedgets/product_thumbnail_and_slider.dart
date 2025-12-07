import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/widgets/appbar/appbar.dart';
import '../../../../../Common/widgets/icons/circuler_icon.dart';
import '../../../../../Common/widgets/images/roundes_image.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/images.dart';
import '../../../../../utils/constans/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SProductThumnailAndSlider extends StatelessWidget {
  const SProductThumnailAndSlider({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      color: dark ? SColors.darkGrey : SColors.light,
      child: Stack(
        children: [
          /// [Image] - Thumbnail
          SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(SSizes.productImageRadius * 2),
              child: Center(
                child: Image(image: AssetImage(SImages.productImage3)),
              ),
            ), // Padding, SizedBox
          ),

          /// Image Slider
          Positioned(
            left: SSizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: SSizes.spaceBtwItems),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => SRoundedImage(
                  width: 80,

                  backgroundColor: dark ? SColors.dark : SColors.white,
                  padding: EdgeInsets.all(SSizes.sm),
                  border: Border.all(color: SColors.primary),
                  imageUrl: SImages.productImage3,
                ),
              ), // SRoundedImage, ListView.builder
            ),
          ), // / SizedBox


          // [Appbar]  back arrow and favourit icon
          SAppBarr(
            showBackArrow: true,
            actions: [
              SCircularIcon(icon: Iconsax.heart5, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
