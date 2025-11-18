import 'package:e_commerce_app/features/authentication/views/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_x/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update current index & jump to next page
  void nextPage() {
    if(currentPageIndex.value==2){
      Get.offAll(()=>LoginScreen());
      return;
    }
    currentPageIndex.value++;
    pageController.jumpToPage(currentPageIndex.value);
  }

  /// Update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}