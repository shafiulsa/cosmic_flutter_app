import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:e_commerce_app/utils/constans/apis.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class CloundinaryServices extends GetxController {
  static CloundinaryServices get instance => Get.find();

  //variable
  final _dio = dio.Dio();

/// [UploadImage] -----------------
  Future<dio.Response> uploadImage(File image,String folderName) async {
    try {
      String api = SApiUrls.uploadApi(SKeys.cloudName);
      dio.FormData formData = dio.FormData.fromMap({
        'upload_preset': SKeys.uploadPreset,
        'folder': folderName,
        'file': await dio.MultipartFile.fromFile(
            image.path, filename: image.path
            .split('/')
            .last), // Assuming file name logic
      });

      dio.Response response = await _dio.post(api, data: formData);

      return response;
    } catch (e) {
      throw 'Failed to upload profile picture. Please try again';
    }
  }


// // / [DeleteImage] - Function to delete image
  Future<dio.Response> deletePicture(String publicId) async {
    try {
      String api = SApiUrls.deleteApi(SKeys.cloudName);

      int timestamp = (DateTime
          .now()
          .millisecondsSinceEpoch / 1000).round();

      String signatureBase = 'public_id=$publicId&timestamp=$timestamp${SKeys
          .apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();

      final formData = dio.FormData.fromMap({
        'public_id': publicId,
        'api_key': SKeys.apiKey,
        'timestamp': timestamp,
        'signature': signature
      });

      dio.Response response = await _dio.post(api, data: formData);

      return response;
    } catch (e) {
      // ... error handling
      throw 'Something wend wrong ,Please try again later';
    }
  }

}