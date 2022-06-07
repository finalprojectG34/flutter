import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/data/database_operations/item_operation.dart';
import 'package:sms/src/models/models.dart';

import '../../../data/repository/item_repository.dart';

class AddItemController extends GetxController {
  final ItemRepository itemRepository;

  AddItemController({required this.itemRepository});

  final GraphQLClient _gqlClient = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink("http://192.168.0.172:8000/graphql"));

  RxBool isCategoryFetchedFromDB = false.obs;
  RxList<Category>? categoryList = <Category>[].obs;

  RxString itemId = ''.obs;
  RxList attributes = [].obs;
  RxMap<String, String> selectedAttributes = <String, String>{}.obs;

  RxMap<String, dynamic>? mockCategory = <String, dynamic>{}.obs;
  RxInt categorySelectPages = 0.obs;
  RxBool isCategoryLoading = true.obs;
  List<String> tempCategories = [];
  RxList<String> selectedCategoryName = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getCategory();
  }

  getCategory() async {
    List<Category> categories = await itemRepository.getCategory();
    categoryList!(categories.obs);
    print(categoryList);
    isCategoryFetchedFromDB(true);
  }

  getMockCategory() async {
    ItemOperation itemOperation = ItemOperation(gqlClient: _gqlClient);
    Map<String, dynamic> result = await itemOperation.getMockCategory();
    mockCategory!(result);
    isCategoryLoading(false);
    print('mock $mockCategory');
    // return a;
  }

  addItem(variable) async {
    Item item = await itemRepository.addItem(variable);
    itemId(item.id);
    print(item.toString() + ' ############################aaaa');
    // isCategoryFetchedFromDB(true);
  }

  addSelectedAttribute(String key, String value) {
    if (selectedAttributes.isEmpty) {
      // selectedAttributes.({key: value});
      selectedAttributes.addEntries(
        [
          MapEntry(
            key,
            value,
          ),
        ],
      );
    } else if (selectedAttributes.containsKey(key)) {
      selectedAttributes.update(key, (val) => value);
    } else {
      selectedAttributes.addEntries(
        [
          MapEntry(
            key,
            value,
          ),
        ],
      );
    }
    print('attrs ${selectedAttributes}');
  }

  changeAttribute(variable) {
    // attributes.clear();
    // attributes.
    // attributes = variable.obs;
    attributes(variable);
  }
}
