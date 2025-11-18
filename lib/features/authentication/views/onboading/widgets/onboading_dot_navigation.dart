import 'package:e_commerce_app/features/authentication/controllers/onboading/onboading_controller.dart';
import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoadingDotNavigation extends StatelessWidget {
  const onBoadingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final _controller= OnBoardingController.instance;

    return Positioned(
      bottom: SDeviceHelper.getBottomNavigationBarHeight()*4,
      left: SDeviceHelper.getScreenWidth(context)/3,
      right: SDeviceHelper.getScreenWidth(context)/3,
      child: SmoothPageIndicator(
        // controller: PageController(),
        controller: _controller.pageController,
        onDotClicked: _controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(),
      ),
    );
  }
}

