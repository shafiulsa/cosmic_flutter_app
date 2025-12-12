import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Data/services/cloudinary_services.dart';
import 'package:e_commerce_app/features/shop/models/brand_category_model.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_category_model.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../utils/exceptions/format_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloundinaryServices());

  /// [Upload] - Function to upload list of brand categories
  Future<void> uploadBrandCategory(List<BrandCategoryModel> brandCategories) async {
    try {
      for (final brandCategory in brandCategories) {
        await _db
            .collection(SKeys.brandCatagoryCollection)
            .doc()
            .set(brandCategory.toJson());

        print('Upload brand  catagory${brandCategory.brandId}');
      }
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again';
    }
  }



  /// [Upload] - Function to upload list of brand categories
  Future<void> uploadProductCategory(List<ProductCategoryModel> productCategories) async {
    try {
      for(final productCategorie in productCategories) {
        await _db.collection(SKeys.productCatagoryCollection).doc().set(productCategorie.toJson());
       print('Upload Product catagory ${productCategorie.productId}');
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



  /// [UploadCategory] - Function to upload list of categories
  Future<void> uploadCategories(List<CategoryModel> categories) async {
    try {
      for (final category in categories) {
        File image = await SHelperFunction.assetToFile(category.image);
        dio.Response response = await _cloudinaryServices.uploadImage(
          image,
          SKeys.categoryFolder,
        );

        if (response.statusCode == 200) {
          category.image = response.data['url'];
        }
        await _db
            .collection(SKeys.categoryCollection)
            .doc(category.id)
            .set(category.toJson());
        print("Category Uploaded : ${category.name}");
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

  /// [FetchCategories] - Function to fetch list of categories
  Future<List<CategoryModel>> getAllCategories() async{
    try{

      final query = await _db.collection(SKeys.categoryCollection).get();

      if(query.docs.isNotEmpty){
        List<CategoryModel> categories = query.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
        return categories;
      }

      return [];

    }on FirebaseException catch(e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  /// [FetchSubCategories] - Function to fetch list ofsub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    try{

      final query = await _db.collection(SKeys.categoryCollection).where('parentId',isEqualTo: categoryId).get();

      if(query.docs.isNotEmpty){
        List<CategoryModel> categories = query.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
        return categories;
      }

      return [];

    }on FirebaseException catch(e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}
