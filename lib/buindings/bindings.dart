import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/checkout/checkout_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class SBuinding extends Bindings{

  @override
  void dependencies() {
  Get.put(NetworkManager());
  Get.put(VariationController());
  Get.put(CheckoutController());
  Get.put(AddressController());
  }
}