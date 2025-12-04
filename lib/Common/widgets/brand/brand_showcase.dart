import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_cart.dart';

class SBrandShowCase extends StatelessWidget {
  const SBrandShowCase({
    super.key, required this.images,

  });
final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark =SHelperFunction.isDarkMode(context);
    return SRoundedContainer(
      showBorder: true,
      borderColor: SColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(SSizes.md),
      margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SBrandCart(showBorder: false,brand: BrandModel.empty()),
      //     Row(
      //         children: [
      //           // buildBrandImage(dark),
      //           // buildBrandImage(dark),
      //           // buildBrandImage(dark)
      //           images.map((images)=> buildBrandImage(dark).toList();
      //         ],
      //
      //     )// SRoundedContainer
      //   ],
      // ),

        Row(
          children: images
              .map((img) => buildBrandImage(dark, img))
              .toList(),
        )

],
      )

    );
  }

  Widget  buildBrandImage(bool dark,String imagePath) {
    return Expanded(
      child: SRoundedContainer(
            height: 100,
            margin: const EdgeInsets.only(right: SSizes.sm),
            padding: const EdgeInsets.all(SSizes.md),
            backgroundColor: dark ? SColors.darkGrey : SColors.light,
            child:  Image(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
    );
  }
}
