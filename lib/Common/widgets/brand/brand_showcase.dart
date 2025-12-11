import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Common/widgets/custome_shape/rounded_container.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/views/brands/brand_products.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_cart.dart';

class SBrandShowCase extends StatelessWidget {
  const SBrandShowCase({
    super.key, required this.images,
    required this.brand

  });
final List<String> images;
final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final dark =SHelperFunction.isDarkMode(context);
    return InkWell(
      onTap: ()=>Get.to(()=>BrandProductScreen(title: brand.name, brand: brand)),
      child: SRoundedContainer(
        showBorder: true,
        borderColor: SColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(SSizes.md),
        margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SBrandCart(showBorder: false,brand: brand),
      
          Row(
            children: images
                .map((img) => buildBrandImage(dark, img))
                .toList(),
          )
      
      ],
        )
      
      ),
    );
  }

  Widget  buildBrandImage(bool dark,String imagePath) {
    return Expanded(
      child: SRoundedContainer(
            height: 100,
            margin: const EdgeInsets.only(right: SSizes.sm),
            padding: const EdgeInsets.all(SSizes.md),
            backgroundColor: dark ? SColors.darkGrey : SColors.light,
            // child:  Image(
            //   image: AssetImage(imagePath),
            //   fit: BoxFit.contain,
            // ),
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, progress) => SShimmerEffect(height: 100,width: 100),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ), // CachedNetworkImage
          ),
    );
  }
}
