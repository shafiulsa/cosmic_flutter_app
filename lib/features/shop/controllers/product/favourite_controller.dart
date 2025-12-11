import 'dart:convert';

import 'package:e_commerce_app/Data/repository/authenticaton_repository.dart';
import 'package:e_commerce_app/Data/repository/product/product_repository.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteController extends GetxController {
  static FavouriteController instance = Get.find();

  /// Variables
  RxMap<String, bool> favourites = <String, bool>{}.obs;
  final _storage = GetStorage(AuthenticatonRepository.instance.currentUser!.uid);

  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  Future<void> initFavourites() async{
    String encodedFavourites = await _storage.read('favourites');
    Map<String, dynamic> storedFavourites = jsonDecode(encodedFavourites) as Map<String, dynamic>;
    favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
  }

  void toggleFavouriteProduct(String productId){
    if(favourites.containsKey(productId)){
      favourites.remove(productId);
      saveFavouritesToStorage();
      SSnackBarHelpers.customToast(message: 'Product has been removed from the Wishlist');
    }else{
      favourites[productId] = true;
      saveFavouritesToStorage();

      SSnackBarHelpers.customToast(message: 'Product has been added to the Wishlist');
    }
  }
  void saveFavouritesToStorage(){
    String encodedFavourites = jsonEncode(favourites);
    _storage.write('favourites', encodedFavourites);
  }

  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }
  Future<List<ProductModel>> getFavouriteProducts() async{
    final productsIds = favourites.keys.toList();
    return await ProductRepository.instance.getFevouriteProduct(productsIds);
  }
}