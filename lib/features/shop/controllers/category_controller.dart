import "package:get/get.dart";
import "package:watchhub/data/repositories/categories/category_repository.dart";
import "package:watchhub/features/shop/models/category_model.dart";
import "package:watchhub/utils/popups/loaders.dart";

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }


  /// -- Load category Data
  Future<void> fetchCategories() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter Featured Categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(7).toList());
    } catch (e) {
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  } 
   
  /// -- Load selected category Data
   
   
  /// -- Get Category Or Sub Category Products
  
  
}


