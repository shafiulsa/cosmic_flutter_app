import 'package:e_commerce_app/features/authentication/controllers/onboading/onboading_controller.dart';
import 'package:e_commerce_app/features/authentication/views/onboading/widgets/onboading_dot_navigation.dart';
import 'package:e_commerce_app/features/authentication/views/onboading/widgets/onboading_next_button.dart';
import 'package:e_commerce_app/features/authentication/views/onboading/widgets/onboading_page.dart';
import 'package:e_commerce_app/features/authentication/views/onboading/widgets/onboading_skip.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboadingScreeen extends StatelessWidget {
  const OnboadingScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller= Get.put(OnBoardingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
        child: Stack(
          children: [
            //scrollable page

            PageView(
              controller: _controller.pageController,
              onPageChanged: _controller.updatePageIndicator,
              children: [
                OnBoadingPage(animation: SImages.onboarding1Animation,title: SText.onBoardingTitle1,subtTitle: SText.onBoardingSubTitle1,),
                OnBoadingPage(animation: SImages.onboarding2Animation,title: SText.onBoardingTitle2,subtTitle: SText.onBoardingSubTitle2,),
                OnBoadingPage(animation: SImages.onboarding3Animation,title: SText.onBoardingTitle3,subtTitle: SText.onBoardingSubTitle3,),
              ],
            ),

          // Indicator
            onBoadingDotNavigation(),

            // Bottom Button
            OnboadingNext(),

            //Skip button
            OnboadingSkipButton()
          ],
        ),
      ),
    );
  }
}

