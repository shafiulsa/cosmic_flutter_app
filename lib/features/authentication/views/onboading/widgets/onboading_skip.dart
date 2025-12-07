import 'package:e_commerce_app/features/authentication/controllers/onboading/onboading_controller.dart';
import 'package:e_commerce_app/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboadingSkipButton extends StatelessWidget {
  const OnboadingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _controller= OnBoardingController.instance;  //controller thaka data pawar jonna

    return Positioned(
      top: SDeviceHelper.getAppBarHeight(),
      right: 0,
      child: Obx(()=> _controller.currentPageIndex==2 ? SizedBox(): TextButton(
        // onPressed: (){},
          onPressed: _controller.skipPage,
          child: Text("Skip")
      ),)
    );
  }
}
