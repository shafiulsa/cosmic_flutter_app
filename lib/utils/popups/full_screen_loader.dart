import 'package:e_commerce_app/utils/constans/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Common/widgets/loaders/animation_loader.dart';
import '../helpers/helper_functions.dart';

class SFullScreenLoader {
  
  // static void openLoadingDialog(String text) {
  //   showDialog(
  //       context: Get.overlayContext!,
  //       barrierDismissible: false,
  //       builder: (_) => PopScope(
  //           canPop: false,
  //           child: Container(
  //             color: SHelperFunction.isDarkMode(Get.context!) ? SColors.dark : SColors.white,
  //             width: double.infinity,
  //             height: double.infinity,
  //             child: Column(
  //               children: [
  //                 /// Extra Space
  //                 const SizedBox(height: 250),
  //
  //                 /// Animation
  //                 SAnimationLoader(text: text)
  //               ],
  //             ),
  //           )));
  // }

  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: SHelperFunction.isDarkMode(Get.context!)
              ? SColors.dark
              : SColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SAnimationLoader(text: text),
          ),
        ),
      ),
    );
  }




  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
