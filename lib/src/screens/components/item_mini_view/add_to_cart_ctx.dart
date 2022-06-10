import 'package:get/get.dart';
import 'package:sms/src/models/models.dart';

import '../../../../data/repository/item_repository.dart';

class AddToCartController extends GetxController {
  final ItemRepository itemRepository;

  AddToCartController({required this.itemRepository});

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
    // await getCategory(queryCategory);
  }

  addToCart(name, shopId, itemId, price, amount) async {
    await itemRepository.addToCart(name, shopId, itemId, price, amount);
  }
}
