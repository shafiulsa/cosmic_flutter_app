import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Data/services/cloudinary_services.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;

class ProductRepository extends GetxController{
  static ProductRepository get to => Get.find();
  final _db=FirebaseFirestore.instance;
  final _cloudinaryServices =Get.put(CloundinaryServices());

///  upload image
  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      for (ProductModel product in products) {
        // thumbnail uploaded
        File thumbnailFile = await SHelperFunction.assetToFile(product.thumbnail);
        dio.Response response = await _cloudinaryServices.uploadImage(thumbnailFile, SKeys.productsFolder);
        if (response.statusCode == 200) {
          product.thumbnail = response.data['url'];
        }


        // image and varification process for only variable tyoe product
        if (product.productType == 'ProductType.variable') {
          // image uploaded
          if (product.images != null && product.images!.isNotEmpty) {
            List<String> imageUrls = [];
            for (String image in product.images!) {
              File imageFile = await SHelperFunction.assetToFile(image);
              dio.Response response = await _cloudinaryServices.uploadImage(imageFile, SKeys.productsFolder);
              if (response.statusCode == 200) {
                imageUrls.add(response.data['url']);
              }
            }
            // verifiation image update
            if (product.productVariations != null) {
              for (final variation in product.productVariations!) {
                int index = product.images!.indexWhere((image) => image == variation.image);
                if (index != -1) {
                  variation.image = imageUrls[index];
                } else {
                  print('Warning:verification image has no product : ${variation.id}');
                }
              }
              product.images!.clear();
              product.images!.addAll(imageUrls);
            }
          }
        }

        // upload porduct in firestore
        await _db.collection(SKeys.productsCollection).doc(product.id).set(product.toJson());
        print('Product ${product.id} uploaded');
      }
    } on FirebaseException catch(e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  // Fetch image
  Future<List<ProductModel>> fetchFeatureProducts() async {
    try {
      final query = await _db.collection(SKeys.productsCollection).where('isFeatured', isEqualTo: true).limit(4).get();

      if(query.docs.isNotEmpty){
        List<ProductModel> products = query.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
        return products;
      }

      return [];
    } on FirebaseException catch(e){
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