import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Data/services/cloudinary_services.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloundinaryServices());

  /// [UploadCategory] - Function to upload list of brand
  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {

      for(BrandModel brand in brands) {

        // convert asset path to File
        File brandImage = await SHelperFunction.assetToFile(brand.image);

        // upload brand image to cloudinary
        dio.Response response = await _cloudinaryServices.uploadImage(brandImage, SKeys.brandsFolder);

        if(response.statusCode == 200) {
          brand.image = response.data['url'];
        }

        // store data to Firebase Fire store
        await _db.collection(SKeys.brandsCollection).doc(brand.id).set(brand.toJson());

        // print('Brand ${brand.name} uploaded successfully');
        print("Asset loaded: ${brand.name}");

      }
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



  /// [Fetch data] - Function to fetch list of brand
  Future<List<BrandModel>> fetchBrands() async {
    try {
      final query = await _db.collection(SKeys.brandsCollection).get();

      if(query.docs.isNotEmpty){
        List<BrandModel> brands = query.docs.map((document) => BrandModel.fromSnapshot(document)).toList();
        return brands;
      }

      return [];

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

}