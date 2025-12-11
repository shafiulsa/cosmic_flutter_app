import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constans/sizes.dart';

class SAnimationLoader extends StatelessWidget {
  final String text;
  final String animation;
  final bool showActionButton;
  final String? actionText;
  final VoidCallback? onPressed;

  const SAnimationLoader({
    super.key,
    required this.text,
    this.animation = SImages.loadingAnimation,
     this.showActionButton=false,
    this.actionText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Animation
          Lottie.asset(animation, width: Get.width * 0.8),
          const SizedBox(height: SSizes.defaultSpace),

          /// Title
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SSizes.defaultSpace),


          //Show action button
          showActionButton ?
          SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(backgroundColor: SColors.dark),
                child: Text(
                  actionText!,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: SColors.light),
                ), // Text
              ) // OutlinedButton
          ) : SizedBox() // Sized Box
        ],
      ),
    );
  }
}
