import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/helpers/helper_functions.dart';

class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = SSizes.sm,
    this.isNetworkImage = false,
    this.showBorder = false,
    this.borderColor = SColors.primary,
    this.borderWidth = 1.0,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? SColors.dark : SColors.light),
        borderRadius: BorderRadius.circular(100),
        border: showBorder? Border.all(color: borderColor, width: borderWidth) : null,
      ),
      // BoxDecoration
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        // child: Image(
        //   fit: fit,
        //   image: isNetworkImage
        //       ? CachedNetworkImage(imageUrl: image)
        //       : AssetImage(image) as ImageProvider,
        // ),
        child: isNetworkImage
            ? CachedNetworkImage(
          fit: fit,
          color: overlayColor,
          progressIndicatorBuilder: (context, url, progress) => SShimmerEffect(width: 55, height: 55),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageUrl: image, // CachedNetworkImage
        )
            : Image(fit: fit, image: AssetImage(image)),
      ), // ClipRRect
      // ClipRRect
    ); // Container
  }
}
