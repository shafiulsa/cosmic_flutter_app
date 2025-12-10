// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_app/Data/services/cloudinary_services.dart';
// import 'package:e_commerce_app/features/shop/models/category_model.dart';
// import 'package:e_commerce_app/features/shop/models/product_model.dart';
// import 'package:e_commerce_app/utils/constans/keys.dart';
// import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
// import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
// import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
//
// import '../../../utils/exceptions/format_exceptions.dart';
//
// class ProductRepository extends GetxController {
//   static ProductRepository get instance => Get.find();
//
//   // Variables
//   final _db = FirebaseFirestore.instance;
//   final _cloudinaryServices = Get.put(CloundinaryServices());
//
//   /// [UploadProduct] - Function to upload list of product
//   Future<void> uploadProducts(List<ProductModel> products) async {
//     try {
//       print("Total products to upload: ${products.length}");
//       for (ProductModel product in products) {
//         //upload thubnail to cloudnary
//         File thumbnailFile = await SHelperFunction.assetToFile(product.thumbnail);
//
//         dio.Response response = await _cloudinaryServices.uploadImage(thumbnailFile,SKeys.productsFolder);
//         if (response.statusCode == 200) {
//           product.thumbnail = response.data['url'];
//         }
//
//
//         if (product.images != null && product.images!.isNotEmpty) {
//           List<String> imageUrls = [];
//
//           // Upload image one by one
//           for (String image in product.images!) {
//             File imagelFile = await SHelperFunction.assetToFile(image);
//             dio.Response response = await _cloudinaryServices.uploadImage(imagelFile,SKeys.productsFolder);
//             if (response.statusCode == 200) {
//               imageUrls.add(response.data['url']);
//
//             }
//           }
//           // update product variation images
//           for(final variation in product.productVariations!){
//             int index=product.images!.indexWhere((image)=> image== variation.image);
//             variation.image=imageUrls[index];
//           }
//
//           //assign image url to product
//           product.images!.clear();
//           product.images!.assignAll(imageUrls);
//         }
//
//         // Upload product to file store
//         await _db.collection(SKeys.productsCollection).doc(product.id).set(product.toJson());
//         print('Product ${product.id} uploaded');
//       }
//     } on FirebaseException catch (e) {
//       throw SFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw SFormatException();
//     } on PlatformException catch (e) {
//       throw SPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again';
//     }
//   }
// }


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
  static ProductRepository get instance => Get.find();
  final _db=FirebaseFirestore.instance;
  final _cloudinaryServices =Get.put(CloundinaryServices());

  ///  upload image
  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      for (ProductModel product in products) {
         final Map<String,String> uploadImageMap={};

        // thumbnail uploaded
        File thumbnailFile = await SHelperFunction.assetToFile(product.thumbnail);
        dio.Response response = await _cloudinaryServices.uploadImage(thumbnailFile, SKeys.productsFolder);
        if (response.statusCode == 200) {
          String url=response.data['url'];;
          uploadImageMap[product.thumbnail]=url;
          product.thumbnail = url;
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

            // // verifiation image update
            // if (product.productVariations != null) {
            //   for (final variation in product.productVariations!) {
            //     int index = product.images!.indexWhere((image) => image == variation.image);
            //     if (index != -1) {
            //       variation.image = imageUrls[index];
            //     } else {
            //       print('Warning:verification image has no product : ${variation.id}');
            //     }
            //   }
            //   product.images!.clear();
            //   product.images!.addAll(imageUrls);
            // }
            // upload product variation images
            if(product.productVariations != null && product.productVariations!.isNotEmpty){

              Map<String, String> uploadedImageMap = {};

              for (int i = 0; i < product.images!.length; i++) {
                uploadedImageMap[product.images![i]] = imageUrls[i];
              }

              for (final variation in product.productVariations!) {
                final match = uploadedImageMap.entries.firstWhere(
                      (entry) => entry.key == variation.image,
                  orElse: () => const MapEntry('', ''),
                );

                if (match.key.isNotEmpty) {
                  variation.image = match.value;
                }
              }
            }

               product.images!.clear();
             product.images!.addAll(imageUrls);
          }
        }

        // upload porduct in firestore
        await _db.collection(SKeys.productsCollection).doc(product.id).set(product.toJson());
        print('Product ${product.id} uploaded  দ্য');
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


  // Fetch feature 4  products
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


  // Fetch feature all  list of products
  Future<List<ProductModel>> fetchAllFeatureProducts() async {
    try {
      final query = await _db.collection(SKeys.productsCollection).where('isFeatured', isEqualTo: true).get();

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


  // Fetch feature all  list of brand spascefic product
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();

      if(querySnapshot.docs.isNotEmpty){
        List<ProductModel> products = querySnapshot.docs.map((document) => ProductModel.fromQuerySnapshot(document)).toList();
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

  // Fetch feature all  list of products
  Future<List<ProductModel>> getProductForBrad({required String brandId,int limit =-1}) async {
    try {
      final query =limit ==-1 ? await _db.collection(SKeys.productsCollection).where('brand.id',isEqualTo: brandId).get()
      : await _db.collection(SKeys.productsCollection).where('brand.id',isEqualTo: brandId).limit(limit).get();


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