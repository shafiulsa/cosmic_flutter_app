import 'package:carousel_slider/carousel_controller.dart';
import 'package:e_commerce_app/Data/repository/banner/banner_repository.dart';
import 'package:e_commerce_app/features/shop/models/banners_model.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
RxBool isLoading= false.obs;


  //variable
  final carousalController=CarouselSliderController();
  RxInt currentIndex=0.obs;

// Variables
  final _repository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();//
  }
//On Caurosal Page Change
  void onPageChange(int index){
    currentIndex.value=index;
  }

  /// Fetch All Banners
  Future<void> fetchBanners() async {
    try {
      //start loading
      isLoading.value=true;
      List<BannerModel> activeBanners = await _repository.fetchActiveBanner();
      banners.assignAll(activeBanners);
    } catch (e) {
      SSnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());

    }
    finally{
      isLoading.value=false;
    }
  }

}