import 'package:get/get.dart';
import 'package:sms/src/models/models.dart';

import '../../../../data/repository/item_repository.dart';

class CartPageController extends GetxController {
  RxBool isCartFetchedFromDB = false.obs;
  RxList<Cart>? cartList = <Cart>[].obs;

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

  getCart(String userId) async {
    List<Cart> carts = await itemRepository.getCart(userId);
    cartList!(carts.obs);
    isCartFetchedFromDB(true);
  }

  addToCart(name, shopId, userId, itemId, price, amount) async {
    await itemRepository.addToCart(name, shopId, userId, itemId, price, amount);
  }

  deleteCart(cartId) async {
    await itemRepository.deleteCart(cartId);
  }
}
