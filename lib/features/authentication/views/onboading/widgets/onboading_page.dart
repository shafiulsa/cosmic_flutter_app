import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoadingPage extends StatelessWidget {
  const OnBoadingPage({
    super.key, required this.animation, required this.title, required this.subtTitle,
  });

   final String animation;
   final String title;
   final String subtTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
          // right: SSizes.defaultSpace,
          // left: SSizes.defaultSpace,
          top: SDeviceHelper.getAppBarHeight()
      ),
      child: Column(
        children: [
          // Lottie.asset(SImages.onboarding1Animation),
          // Animation
          Lottie.asset(animation),

          // Title
          Text(title,style: Theme.of(context).textTheme.headlineMedium,
          ),


          //SubTitle
          Text(
            subtTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
