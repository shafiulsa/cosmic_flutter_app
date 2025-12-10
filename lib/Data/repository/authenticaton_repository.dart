
import 'package:e_commerce_app/Data/repository/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/controllers/onboading/onboading_controller.dart';
import 'package:e_commerce_app/features/authentication/views/login/login.dart';
import 'package:e_commerce_app/features/authentication/views/onboading/onboading.dart';
import 'package:e_commerce_app/features/authentication/views/signup/verify_email.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/exceptions/firebase_auth_exceptions.dart';

class AuthenticatonRepository extends GetxController {
  static AuthenticatonRepository get instance => Get.find();
  final localStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  @override
  void onReady() {
    super.onReady();
    print("onReady called!");
    FlutterNativeSplash.remove();
    screenRedirect();

    // admin panel na thakay ai way use korteci

    // ata ak bar  e chalabo  catagory data  firebase firestore a fetch ar jonna
    // Get.put(CategoryRepository()).uploadCategories(SDummyData.categories);


    // ata ak bar  e chalabo  banner data  firebase firestore a fetch ar jonna
    // Get.put(BannerRepository()).uploadBanners(SDummyData.banner);

    // // ata ak bar  e chalabo  brand data  firebase firestore a fetch ar jonna
   // Get.put(BrandRepository()).uploadBrands(SDummyData.brands);

    // // ata ak bar  e chalabo  Product data  firebase firestore a fetch ar jonna
    //
    // Get.put(ProductRepository()).uploadProducts(SDummyData.products);


  }

  void screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        //if verified then go to navigation screen
        Get.offAll(() => NavigationMenu());
      } else {
        //if not verified then go to verify email screen
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      localStorage.writeIfNull('isFirstTime', true);
      // IMPORTANT: Put controller before going to onboarding screen
      Get.put(OnBoardingController());
      localStorage.read('isFirstTime') == true
          ? Get.to(() => OnboadingScreeen())
          : Get.to(() => LoginScreen());
    }
  }

  /// [Authentication] - With Email & Password
  Future<UserCredential> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Authentication] - Signin
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Google Authentication] - Google Sign-In
  Future<UserCredential> signinWithGoogle() async {
    try {
      // Create an instance of GoogleSignIn
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Show Popup to select Google account
      final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

      // Check if the user cancelled the sign-in
      if (googleAccount == null) {
        throw 'Google Sign-In cancelled by user.';
      }

      // Get the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;

      // Create credentials using only idToken
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Sign In using Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. Error: $e';
    }
  }

  /// [EmailVerification]- Manually Check if email is verified
  Future<void> sendEmailVarification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ForrgetPassword]- Manually Check if email is verified
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // // / [ForgetPassword] - Send Mail To Reset Password
  Future<void> reAuthenticateUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(
        e.code,
      ).message; // Assuming SFirebaseAuthException is used
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Logout] - Logout the user
  Future<void> logout() async {
    try {
      // 1. Sign out the user from Firebase
      await FirebaseAuth.instance.signOut();
      //Google log ar jonna signout
      await GoogleSignIn().signOut();

      // 2. Navigate to the Login Screen and clear all previous screens
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [DeleteUser] - delete user account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(currentUser!.uid);
      // // Remove profile picture from Cloudinary
      String publicId = UserController.instance.user.value.publicId;
      if (publicId.isNotEmpty) {
        UserRepository.instance.deleteProfilePicture(publicId);
      }

      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
