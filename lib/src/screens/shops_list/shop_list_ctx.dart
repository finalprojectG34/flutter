import 'package:get/get.dart';
import 'package:sms/src/models/shop.dart';

import '../../../data/repository/shop_repository.dart';

class ShopListController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var shopList = Rx<List<Shop>?>(null);
  final ShopRepository shopRepository;

  ShopListController({required this.shopRepository});
  @override
  onReady() {
    getShops();
    super.onReady();
  }

  Future<List<Shop>?> getShops() async {
    isLoading(true);
    try {
      final categories = await shopRepository.getShops();
      shopList.value = categories;
      return categories;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
    return null;
  }
}
