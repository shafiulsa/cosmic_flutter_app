import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/features/personalization/models/address_model.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  /// [Upload] - Function to store user address
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticatonRepository.instance.currentUser!.uid;
      final currentAddress = await _db
          .collection(SKeys.userCollection)
          .doc(userId)
          .collection(SKeys.addressCollection)
          .add(address.toJson());


      return currentAddress.id;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while saving Address Information. Please try again';
    }
  }

  /// [Fetch] - Function to fetch user address
  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticatonRepository.instance.currentUser!.uid;
      if(userId.isEmpty) throw 'User not found login again';
      final query = await _db
          .collection(SKeys.userCollection)
          .doc(userId)
          .collection(SKeys.addressCollection)
          .get();

      if(query.docs.isNotEmpty){
        List<AddressModel> addresses = query.docs.map((doc) => AddressModel.fromDocumentSnapshot(doc)).toList();
        return addresses;
      }
      return [];
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Unable to find address. Please try again';
    }
  }

 /// [Update] - Function to update Selected Field of Address
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticatonRepository.instance.currentUser!.uid;
      await _db.collection(SKeys.userCollection).doc(userId).collection(SKeys.addressCollection).doc(addressId).update({
        'selectedAddress': selected,
      });
    } catch (e) {
      throw 'Unable to update selected address. Please try again';
    }
  }

}
