import 'package:get/get.dart';
import 'package:sms/data/repository/shop_repository.dart';
import 'package:sms/src/models/shop.dart';

class ShopsListController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var shopsList = Rx<List<Shop>?>(null);
  final ShopRepository shopRepository;

  ShopsListController({required this.shopRepository});

  Future<List<Shop>?> getShops(int pageIndex, int pageSize) async {
    if (pageIndex < 1) {
      isLoading(true);
    }
    try {
      final shops = await shopRepository.getShops(pageSize, pageIndex);
      shopsList.value = shops;
      return shops;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
    return null;
  }
}
