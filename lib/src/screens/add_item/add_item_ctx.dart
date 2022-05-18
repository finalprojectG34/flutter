import 'package:get/get.dart';
import 'package:sms/src/models/models.dart';

import '../../../data/repository/item_repository.dart';

class AddItemController extends GetxController {
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

  ItemRepository itemRepository = ItemRepository();

  @override
  void onInit() async {
    super.onInit();
    await getCategory(queryCategory);
  }

  getCategory(String query) async {
    List<Category> categories = await itemRepository.getCategory(query);
    categoryList!(categories.obs);
    print(categoryList);
    isCategoryFetchedFromDB(true);
  }

  addItem(variable) async {
    Item item = await itemRepository.addItem(variable);
    itemId(item.id);
    print(item.toString() + ' ############################aaaa');
    // isCategoryFetchedFromDB(true);
  }
}
