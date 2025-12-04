import 'package:e_commerce_app/Data/repository/brand/brand_repository.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();


  /// Variables
  final _repository = Get.put(BrandRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  RxBool isLoading=false.obs;


  @override
  void onInit() {
getBrands();
super.onInit();
  }

  /// Get All Brands And Featured Brands
  Future<void> getBrands() async {
    try {
      //start loading
      isLoading.value=true;

      List<BrandModel> allBrands = await _repository.fetchBrands();

      this.allBrands.assignAll(allBrands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).toList());
    } catch (e) {
      SSnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
    finally{
      isLoading.value=false;
    }
  }
}