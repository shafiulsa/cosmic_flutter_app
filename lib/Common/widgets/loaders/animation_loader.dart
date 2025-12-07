
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constans/sizes.dart';

class SAnimationLoader extends StatelessWidget {
  final String text;
  final String animation;
  
  


  const SAnimationLoader({
    super.key,
    required this.text,   this.animation = SImages.loadingAnimation,

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
          Text(text, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
          const SizedBox(height: SSizes.defaultSpace),
          
  ],
      ),
    );
  }
}
