import 'package:e_commerce_app/Data/repository/product/product_repository.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constans/enums.dart';
import 'package:e_commerce_app/utils/constans/text.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Variables
  final _repository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getFeaturedProduct();
    super.onInit();
    //
  }

  /// Function to get only 4 featured products
  Future<void> getFeaturedProduct() async {
    try {
      // start loading
      isLoading.value = true;

      // Fetch feature product
      List<ProductModel> featuredProducts = await _repository
          .fetchFeatureProducts();

      // assign products
      this.featuredProducts.assignAll(featuredProducts);
    } catch (e) {
      SSnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //calculate sels percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0.0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;

    return percentage.toStringAsFixed(1);
  }

  // price range for variable product

  String getProductPrice(ProductModel product) {
    // Initialize smallest and largest price
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if not variation exist, return the single price or sale price
    if (product.productType == ProductType.single.toString()) {
      return product.salePrice > 0
          ? product.salePrice.toString()
          : product.price.toString();
    } else {
      // calculate the smallest and largest price among variation
      for (final variation in product.productVariations!) {
        double variationPrice = variation.salePrice > 0
            ? variation.salePrice
            : variation.price;

        if (variationPrice > largestPrice) {
          largestPrice = variationPrice;
        }

        if (variationPrice < smallestPrice) {
          smallestPrice = variationPrice;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toStringAsFixed(0);
      } else {
        return '${largestPrice.toStringAsFixed(0)} - ${SText.currency}${smallestPrice.toStringAsFixed(0)}';
      }
    }
  }
}
