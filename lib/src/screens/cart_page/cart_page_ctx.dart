import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sms/src/models/models.dart';

import '../../../data/repository/cart_repository.dart';

class CartPageController extends GetxController {
  final CartRepository cartRepository;

  final storage = Get.find<FlutterSecureStorage>();

  CartPageController({required this.cartRepository});

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
  RxString err = ''.obs;
  RxBool errOccurred = false.obs;
  RxBool isCartLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getCart();
  }

  getCart() async {
    isCartLoading(true);
    try {
      List<Cart> carts = await cartRepository.getCart();
      cartList!(carts);
    } on TimeoutException catch (e) {
      err(e.message);
      errOccurred(true);
    } catch (e) {
      err('Some error occurred');
      errOccurred(true);
    }

    isCartLoading(false);
  }

  addToCart(Cart cart) async {
    await cartRepository.addToCart(cart);
  }

  deleteCart(cartId) async {
    await cartRepository.deleteCart(cartId);
    cartList!(cartList?.where((p0) => p0.id != cartId).toList());
  }
}
