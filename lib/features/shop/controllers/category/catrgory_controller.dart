import 'package:e_commerce_app/Data/repository/category/category_repository.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// Variables
  final _repository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  RxBool isCategoriesLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

// Function to get all categories & featured categories from Firebase
  Future<void> fetchCategories() async {
    try {
      // start loading
      isCategoriesLoading.value = true;

      // fetch categories
      List<CategoryModel> categories = await _repository.getAllCategories();
      allCategories.assignAll(categories);

      // get featured categories
      featuredCategories.assignAll(categories.where((category) => category.isFeatured && category.parentId.isEmpty));

    } catch(e) {
      SSnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    } finally {
      isCategoriesLoading.value = false;
    }
  }

}
