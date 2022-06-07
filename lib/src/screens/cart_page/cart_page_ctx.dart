import 'package:get/get.dart';
import 'package:sms/src/models/models.dart';

import '../../../../data/repository/item_repository.dart';

class CartPageController extends GetxController {
  final ItemRepository itemRepository;

  CartPageController({required this.itemRepository});

  RxBool isCartFetchedFromDB = false.obs;
  RxList<Cart>? cartList = <Cart>[].obs;

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
    await getCart("629af7f97d524a03af577688");
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
    cartList!(cartList?.where((p0) => p0.id != cartId).toList());
  }
}
