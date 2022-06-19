import 'package:get/get.dart';
import 'package:sms/src/app.dart';

import '../../../data/repository/category_repository.dart';

class CategoryListController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var categoryList = Rx<List<Category>?>(null);
  final CategoryRepository categoryRepository;

  CategoryListController({required this.categoryRepository});
  @override
  onReady() {
    getCategory();
    super.onReady();
  }

  Future<List<Category>?> getCategory() async {
    try {
      final categories = await categoryRepository.getCategory();
      categoryList.value = categories;
      return categories;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
    return null;
  }
}
