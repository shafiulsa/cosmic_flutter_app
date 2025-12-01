import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';


class LoginControlle extends GetxController{
  static LoginControlle get instance => Get.find();
  /// Variables
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;
  final loginFormKey=GlobalKey<FormState>();

  final localStorage=GetStorage();

  @override
  void onInit() {
  email.text=localStorage.read(SKeys.rememberMeEmail)?? '';
  password.text=localStorage.read(SKeys.rememberMePassword)?? '';
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      // Start Loading
      SFullScreenLoader.openLoadingDialog('Logging you in...');

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        SSnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;}

      // Save Data if remember me is checked
      if (rememberMe.value) {
        localStorage.write(SKeys.rememberMeEmail, email.text.trim());
        localStorage.write(SKeys.rememberMePassword, password.text.trim());
      }

      // Login User with Email and Password
      await AuthenticatonRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Stop Loading
      SFullScreenLoader.stopLoading();

      // Redirect
      AuthenticatonRepository.instance.screenRedirect();

    } catch(e) {
      // Catch block executed if any of the await calls throw an exception
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.errorSnackBar(title: 'Login Failed', message: e.toString());
    }
  }
}