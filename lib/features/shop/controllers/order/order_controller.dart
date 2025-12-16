import 'package:e_commerce_app/Common/widgets/scrrens/success_screen.dart';
import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/Data/repository/order/order_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:e_commerce_app/features/shop/models/order_model.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constans/enums.dart';
import 'package:e_commerce_app/utils/constans/images.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  final cartController = CartController.instance;
  final checkoutController = CheckoutController.instance;
  final addressController = AddressController.instance;

  final _repository = Get.put(OrderRepository());

  Future<void> processOrder(double totalAmount) async {
    try {
      SFullScreenLoader.openLoadingDialog('Processing your order...');
      String userId = AuthenticatonRepository.instance.currentUser!.uid;
      if (userId.isEmpty) return;

      // Create Order model
      // Create Order Model
      OrderModel order = OrderModel(
        id: UniqueKey().toString(),
        status: OrderStatus.pending,
        items: cartController.cartItems.toList(),
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        userId: userId,
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
      );
      // save order
      await _repository.saveOrder(order);

      // update cart
      cartController.clearCart();

      //show success screem
      Get.to(
        () => SuccessScreen(
          title: "Payment Successfull",
          subTitle: 'Your item will be shipped Soon !',
          image: SImages.successfulPaymentIcon,
          onTap: () => Get.offAll(() => NavigationMenu()),
        ),
      );
    } catch (e) {
      SSnackBarHelpers.errorSnackBar(
        title: 'Order failed',
        message: e.toString(),
      );
    }
  }


  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final orders = await OrderRepository.instance.fetchUserOrders();
      return orders;
    } catch (e) {
      SSnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
      return [];
    }
  }


}
