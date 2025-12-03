import 'package:e_commerce_app/Common/widgets/images/circuler_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/constans/sizes.dart';

class SVerticalImageText extends StatelessWidget {
  const SVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    required this.textColor,
    this.backGroundColor,
    this.onTap,
  });

  final String title, image;
  final Color textColor;
  final Color? backGroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ///
          SCircularImage(
            image: image,
            height: 56,
            width: 56,
            isNetworkImage: true,
          ),

          SizedBox(height: SSizes.spaceBtwItems / 2),
          // title
          SizedBox(
            width: 55,
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: textColor),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ), // Text
          ), // SizedBox
        ],
      ),
    );
  }
}
