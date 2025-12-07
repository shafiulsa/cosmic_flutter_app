import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/Data/services/cloudinary_services.dart';
import 'package:e_commerce_app/features/authentication/models/user_model.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  //variable
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloundinaryServices());

//function to store data
  Future<void> saveUserRecord(UserModel user) async {
    try {
      // UserCredential userCredential = await _auth
      await _db.collection(SKeys.userCollection).doc(user.id).set(
          user.toJson());
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


  /// [Read ]
  //function to fatch user details
  Future<UserModel> fetchUserDetails() async {
    try {
      // UserCredential userCredential = await _auth
      final documentSnapshot = await _db.collection(SKeys.userCollection).doc(
          AuthenticatonRepository.instance.currentUser!.uid).get();
      if (documentSnapshot.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapshot);
        return user;
      }

      return UserModel.empty();
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


  // // / [Update] - Function to update user single field
  Future<void> updateSingleField(Map<String, dynamic> map) async {
    try {
      await _db.collection(SKeys.userCollection).doc(
          AuthenticatonRepository.instance.currentUser!.uid).update(map);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code)
          .message; // Assuming SFirebaseAuthException is used
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


  // // / [Update] - Function to delete user record
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection(SKeys.userCollection).doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code)
          .message; // Assuming SFirebaseAuthException is used
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

  Future<dio.Response> uploadImage(File image) async {
    try {
      dio.Response response = await _cloudinaryServices.uploadImage(
          image, SKeys.profileFolder);
      return response;
    } catch (e) {
      throw 'Failed to upload profile picture. Please try again';
    }
  }


// // / [DeleteImage] - Function to delete profile picture
  Future<dio.Response> deleteProfilePicture(String publicId) async {
    try {
      dio.Response response = await _cloudinaryServices.deletePicture(publicId);
     return response;
    } catch (e) {
      // ... error handling
      throw 'Something wend wrong ,Please try again later';
    }
  }

}