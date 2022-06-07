import 'package:get/get.dart';
import 'package:sms/src/models/models.dart';

import '../../../../data/repository/item_repository.dart';

class AddToCartController extends GetxController {
  RxBool isCategoryFetchedFromDB = false.obs;
  RxList<Category>? categoryList = <Category>[].obs;
  String queryCategory = '''
  query GetAllCategory{
  getAllCategories {
    id
    name  
  }
}
  ''';
  RxString itemId = ''.obs;
  RxList attributes = [].obs;
  RxMap<String, String> selectedAttributes = <String, String>{}.obs;
  ItemRepository itemRepository = ItemRepository();

  RxMap<String, dynamic>? mockCategory = <String, dynamic>{}.obs;
  RxInt categorySelectPages = 0.obs;
  RxBool isCategoryLoading = true.obs;
  List<String> tempCategories = [];
  RxList<String> selectedCategoryName = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
    // await getCategory(queryCategory);
  }

  getCart(String query) async {
    List<Category> categories = await itemRepository.getCategory(query);
    categoryList!(categories.obs);
    print(categoryList);
    isCategoryFetchedFromDB(true);
  }

  addToCart(name, shopId, userId, itemId, price, amount) async {
    await itemRepository.addToCart(name, shopId, userId, itemId, price, amount);
  }
}
