import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/features/shop/models/order_model.dart';
import 'package:e_commerce_app/utils/constans/keys.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  /// [Save] - Save user Order
  Future<void> saveOrder(OrderModel order) async {
    try {
      await _db.collection(SKeys.userCollection)
          .doc(order.userId)
          .collection(SKeys.orderCollection)
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving order info';
    }
  }

  ///[Fetch] -users order

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticatonRepository.instance.currentUser!.uid;
      if (userId.isEmpty) throw 'Unable to find user information';

      final query = await _db.collection(SKeys.userCollection)
          .doc(userId)
          .collection(SKeys.orderCollection)
          .get();

      if (query.docs.isNotEmpty) {
        List<OrderModel> orders = query.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
        return orders;
      }

      return [];
    } catch (e) {
      throw 'Something went wrong while fetching order info';
    }
  }



}
