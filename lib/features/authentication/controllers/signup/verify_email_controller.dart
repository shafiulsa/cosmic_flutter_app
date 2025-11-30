import 'dart:async';

import 'package:e_commerce_app/Common/widgets/scrrens/success_screen.dart';
import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVarification();
    setTimerForAutoRedirect();
    super.onInit(); //
  }


  /// [EmailVerification] - Send Mail
  /// Send Email Verification Link to Current user
  Future<void> sendEmailVarification() async {
    try {
      await AuthenticatonRepository.instance.sendEmailVarification();

      // Success Message
      SSnackBarHelpers.successSnackBar(title: 'Email Sent',
          message: 'Please check your inbox and verify your');
    } catch (e) {
      // Error Message
      SSnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  void setTimerForAutoRedirect() async {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      // 1. Reload the user's status from Firebase
      await FirebaseAuth.instance.currentUser!.reload();

      // 2. Get the updated user object
      final user = FirebaseAuth.instance.currentUser;

      // 3. Check if the user's email is now verified
      if (user?.emailVerified ?? false) {
        // Cancel the timer to stop the recurring checks
        timer.cancel();

        // Redirect to a Success Screen (using GetX navigation)
        Get.off(() =>
            SuccessScreen(
              title: SText.accountCreatedTitle,
              subTitle: SText.accountCreatedSubTitle,
              image: SImages.successfulPaymentIcon,
              onTap: () => AuthenticatonRepository.instance.screenRedirect(),
            )); // SuccessScreen
      }
    }); // Timer.periodic
  }


  /// Manually Check if email is verified
  Future<void> checkEmailVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null && currentUser.emailVerified) {
        Get.off(() => SuccessScreen(
          title: SText.accountCreatedTitle,
          subTitle: SText.accountCreatedSubTitle,
          image: SImages.successfulPaymentIcon,
          onTap: () => AuthenticatonRepository.instance.screenRedirect(),
        ));
      }
    } catch(e) {
      // The rest of the catch block is not visible in the image
    }
  }

}