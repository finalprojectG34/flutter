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

  // String addItemMutation = '''
  //     mutation AddItem(\$createItemInput: ItemCreateInput!){
  //       createItem(input: createItemInput){
  //         name
  //         id
  //       }
  //     }
  //     ''';
  // final addItemVariable ={
  //   "createItemInput":{
  //     "name" : langName,
  //     "saveFormat" : saveFormat,
  //   }
  // };
  ItemRepository itemRepository = ItemRepository();

  @override
  void onInit() {
    super.onInit();
    getCategory(queryCategory);
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
