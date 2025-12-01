import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/features/authentication/views/forget_pasword/reset_password.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  // Variable
final email =TextEditingController();
final forgetPasswordFormKey= GlobalKey<FormState>();


  /// Send Email to Forget Password
  Future<void> sendPasswordResetEmail() async {
    try {
      // 1. START LOADING
      SFullScreenLoader.openLoadingDialog('Processing your request...');

      // 2. CHECK INTERNET CONNECTIVITY
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        SSnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // 3. FORM VALIDATION
      if (!forgetPasswordFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      // 4. SEND EMAIL TO RESET PASSWORD
      await AuthenticatonRepository.instance.sendPasswordResetEmail(email.text);

      // 5. STOP LOADING & SUCCESS MESSAGE
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to Reset your Password.'
      );

      // 6. REDIRECT (Implied Get.offAll or Get.back() here, not visible)
       Get.to(()=> ResetPAsswordScreen(email: email.text.trim()));
    } catch(e) {
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.errorSnackBar(title: 'Failed to Send', message: e.toString());
    }
  }


  /// Send Email to Forget Password
  Future<void> reSendPasswordResetEmail() async {
    try {
      // 1. START LOADING
      SFullScreenLoader.openLoadingDialog('Processing your request...');

      // 2. CHECK INTERNET CONNECTIVITY
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        SSnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }



      // 4. SEND EMAIL TO RESET PASSWORD
      await AuthenticatonRepository.instance.sendPasswordResetEmail(email.text);

      // 5. STOP LOADING & SUCCESS MESSAGE
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to Reset your Password.'
      );

    } catch(e) {
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.errorSnackBar(title: 'Failed to Send', message: e.toString());
    }
  }


}