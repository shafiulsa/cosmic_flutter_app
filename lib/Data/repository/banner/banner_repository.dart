import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Data/services/cloudinary_services.dart';
import 'package:e_commerce_app/features/shop/models/banners_model.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloundinaryServices());

  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      for (final banner in banners) {
        // convert assetPath to File
        File image = await SHelperFunction.assetToFile(banner.imageUrl);

        //upload banner image to cloudinary
        dio.Response response = await _cloudinaryServices.uploadImage(
          image,
          SKeys.bannersFolder,
        ); // Note: UKeys is likely a folder key
        if (response.statusCode == 200) {
          banner.imageUrl = response.data['url'];
        }

        // Push data in firebase firestore
        await _db.collection(SKeys.bannerCollection).doc().set(banner.toJson());
        print('Banner Uploaded : ${banner.targetScreen}');
      }
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

  Future<List<BannerModel>> fetchActiveBanner() async {
    try {
      final query = await _db.collection(SKeys.bannerCollection).where('active', isEqualTo: true).get();
      if (query.docs.isNotEmpty) {
        List<BannerModel> banners = query.docs.map((document) => BannerModel.fromDocument(document)).toList();
        return banners;
      }

      return [];
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
