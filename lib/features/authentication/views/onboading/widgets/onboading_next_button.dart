import 'package:e_commerce_app/Common/widgets/button/elevated_button.dart';
import 'package:e_commerce_app/features/authentication/controllers/onboading/onboading_controller.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboadingNext extends StatelessWidget {
  const OnboadingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _controller= OnBoardingController.instance;  //controller thaka data pawar jonna
    return Positioned(
      left: 0,
      right: 0,
      bottom: SSizes.spaceBtwItems,
      child: SElevatedButton(

        // onPress: (){},
        onPress: _controller.nextPage,
        //last onboading a jonna message ta change hob
        child: Obx(()=>Text(_controller.currentPageIndex.value==2 ? 'Get Started':'next')),

      ),);
  }
}
