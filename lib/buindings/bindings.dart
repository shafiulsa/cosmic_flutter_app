import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class SBuinding extends Bindings{

  @override
  void dependencies() {
  Get.put(NetworkManager());
  }
}