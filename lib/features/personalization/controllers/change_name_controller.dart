import 'package:e_commerce_app/Data/repository/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  // // / Variables
  final _userController = UserController.instance;
  final _userRepository= UserRepository.instance;

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final updateUserFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  void initializeNames() {
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
  }

  // // Update User Name
  Future<void> updateUserName() async {
    try {
      // // Start Loading
      SFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
      );

      // // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      // // Form Validation
      if (!updateUserFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      // // Update User Name From FireStore
// // Update User Name From Fire store
      Map<String, dynamic> map = {'firstName': firstName.text, 'lastName': lastName.text};
      await _userRepository.updateSingleField(map);

// // Update user from RX User
      _userController.user.value.firstName = firstName.text;
      _userController.user.value.lastName = lastName.text;

// // Stop Loading
      SFullScreenLoader.stopLoading();

// // Redirect
      Get.offAll(() => NavigationMenu());

// // Success Message
      SSnackBarHelpers.successSnackBar(title: 'Congratulations', message: 'Your name has been updated.');

    } catch(e) {

      // // Stop Loading
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.errorSnackBar(title: 'Update Name Failed!', message: e.toString());

    }
  }
}
