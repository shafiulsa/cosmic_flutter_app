import 'package:e_commerce_app/Data/repository/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/models/user_model.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  //variable
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading=false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Function to save user record
  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
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
      profileLoading.value=true;
      // Fetch the UserModel from the user repository/database service
      UserModel user = await _userRepository.fetchUserDetails();

      // Update the reactive user state (this.user is assumed to be an Rx<UserModel>)
      this.user(user);
    } catch (e) {
      // If fetching fails, set the user state to an empty/default model
      user(UserModel.empty());
    }
    finally{
      profileLoading.value=false;
    }
  }
}
