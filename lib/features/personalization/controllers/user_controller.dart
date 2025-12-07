import 'dart:io';

import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/Data/repository/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/models/user_model.dart';
import 'package:e_commerce_app/features/authentication/views/login/login.dart';
import 'package:e_commerce_app/features/personalization/view/edit_profile/widgets/re_authentication_user_form.dart';
import 'package:e_commerce_app/utils/constans/sizes.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  //variable
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;


  //Re-authenticate Form variable
  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool isProfileUploading=false.obs;


  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Function to save user record
  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      await fetchUserDetails();
      if (user.value.id.isEmpty) {
        // Convert Full Name to First Name & Last Name
        final nameParts = UserModel.nameParts(userCredential.user!.displayName);
        final username =
            '${userCredential.user!.displayName}2312637'; // Placeholder UID

        // create user model
        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // save user record
        await _userRepository.saveUserRecord(userModel);
      }
    } catch (e) {
      // Error is typically handled by showing a warning, as the auth step succeeded
      SSnackBarHelpers.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving user data: ${e.toString()}',
      );
    }
  }

  /// Function to fetch user details
  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      // Fetch the UserModel from the user repository/database service
      UserModel user = await _userRepository.fetchUserDetails();

      // Update the reactive user state (this.user is assumed to be an Rx<UserModel>)
      this.user(user);
    } catch (e) {
      // If fetching fails, set the user state to an empty/default model
      user(UserModel.empty());
    }
    finally {
      profileLoading.value = false;
    }
  }


  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(SSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete account permanently?',
        confirm: ElevatedButton(
          onPressed: () => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          // Assuming BorderSide Color
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: SSizes.lg),
            child: Text('Delete'),
          ), // Padding
        ),
        // ElevatedButton
        cancel: OutlinedButton(
            onPressed: () => Get.back(), child: Text('Cancel'))
    );
  }


  Future<void> deleteUserAccount() async {
    try {
      // // Start Loading
      SFullScreenLoader.openLoadingDialog('Processing...');

      // // Re-Authentication User
      final authRepository = AuthenticatonRepository.instance;
      final provider = authRepository.currentUser!
          .providerData
          .map((e) => e.providerId)
          .first;

      // // If Google Provider
      if (provider == 'google.com') {
        await authRepository.signinWithGoogle();
        await authRepository.deleteAccount();
        SFullScreenLoader.stopLoading();
        Get.offAll(() => LoginScreen());
      }
      // // If Email/Password Provider
      else if (provider == 'password') {
        SFullScreenLoader.stopLoading();
        Get.to(() => ReAuthenticationUserForm());
      }
    } catch (e) {
      // ... error handling
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }


  Future<void> reAuthenticateUser() async {
    try {
      // // Start Loading
      SFullScreenLoader.openLoadingDialog('Processing...');

      // // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      // // Form Validation
      if (!reAuthFormKey.currentState!
          .validate()) { // Assuming reAuthFormKey is the variable name
        SFullScreenLoader.stopLoading();
        return;
      }

      //Reauthenticate User with email and password
      await AuthenticatonRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      /// Delete account
      await AuthenticatonRepository.instance.deleteAccount();

      //stop Loading
      SFullScreenLoader.stopLoading();

      //Redirect
      Get.offAll(() => LoginScreen());
    } catch (e) {
      //stop Loading
      SFullScreenLoader.stopLoading();
      SSnackBarHelpers.errorSnackBar(title: 'Faield', message: e.toString());
    }
  }


  Future<void> updateUserProfilePicture() async {
    try {

      isProfileUploading.value=true;
 // Pick Image from Gallery
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 512, maxWidth: 512); // Assuming maxWidth: 512
      if (image == null) return;

// // Convert XFile to File
      File file = File(image.path);
 // delete user current profile pciture
      if(user.value.publicId.isNotEmpty){
        await _userRepository.deleteProfilePicture(user.value.publicId);
      }
// // Upload profile Picture to Cloudinary
      dio.Response response = await _userRepository.uploadImage(file);

      if (response.statusCode == 200) {
        // // Get Data
        final data = response.data;
        final imageUrl = data['url'];
        final publicId = data['public_id']; // Variable publicId is not used in the snippet shown

        // // update profile picture from Fire store
        await _userRepository.updateSingleField({'profilePicture': imageUrl,'publicId':publicId});

        user.value.profilePicture=imageUrl;
        user.value.publicId=publicId;

        user.refresh();

        //Show success message
        SSnackBarHelpers.successSnackBar(title: "Congratulation",message: 'Profile pricure update successfully');
      } else {
       throw 'Failed to upload profile picture . Please try anaing later';
      }
    } catch (e) {

 SSnackBarHelpers.errorSnackBar(title: "Failed",message: e.toString());
    }
    finally{
      isProfileUploading.value=false;
    }
  }
}