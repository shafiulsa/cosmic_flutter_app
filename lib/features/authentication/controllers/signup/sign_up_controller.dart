import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/Data/repository/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/models/user_model.dart';
import 'package:e_commerce_app/features/authentication/views/signup/verify_email.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///variables
  final _authRepository = Get.put(AuthenticatonRepository());
  final signUpForKey = GlobalKey<FormState>();
  RxBool isPasswordVisble = false.obs;
  RxBool privacyPolicy = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  /// function to register the user with email and password

  Future<void> registerUser() async {
    try {
      //start loading
      SFullScreenLoader.openLoadingDialog("We are processing Your information");
      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        SSnackBarHelpers.warningSnackBar(
          title: 'No Internet Connection',
          message:
              "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use",
        );
        return;
      }

      // Check Privacy Policy

      if (!privacyPolicy.value) {
        SFullScreenLoader.stopLoading();
        SSnackBarHelpers.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      //form validation
      if (!signUpForKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //Register the user using Firebase Authentication
      UserCredential userCredential = await _authRepository.registerUser(
        email.text.trim(),
        password.text.trim(),
      );

      //create user model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        username: '${firstName.text}${lastName.text}716283',
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      //save user record
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(userModel);

      // stop loading
      SFullScreenLoader.stopLoading();

      SSnackBarHelpers.successSnackBar(
        title: 'Congratulations!',
        message: 'Your account has been created! Verify your email.',
      );
      // redirect to verify email screen
      Get.to(() => VerifyEmailScreen());
    } catch (e) {
      // stop loading
      SFullScreenLoader.stopLoading();

      SSnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
