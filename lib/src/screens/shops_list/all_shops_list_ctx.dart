import 'package:get/get.dart';
import 'package:sms/data/repository/shop_repository.dart';
import 'package:sms/src/models/shop.dart';

class AllShopsListController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var shopsList = Rx<List<Shop>?>(null);
  final ShopRepository shopRepository;

  Rx<Shop> shop = const Shop().obs;

  AllShopsListController({required this.shopRepository});

  // Future<List<Shop>?> getShops(int pageIndex, int pageSize) async {
  //   if (pageIndex < 1) {
  //     isLoading(true);
  //   }
  //   try {
  //     final shops = await shopRepository.getShops(pageSize, pageIndex);
  //     shopsList.value = shops;
  //     return shops;
  //   } catch (e) {
  //     errorOccurred(true);
  //   } finally {
  //     isLoading(false);
  //   }
  //   return null;
  // }

  getShopByRole(String role) async {
    isLoading(true);
    try {
      final shops = await shopRepository.getShopByRole(role);
      shopsList(shops);
      errorOccurred(false);
    } catch (e) {
      print(e);
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  getShopById(String shopId) async {
    isLoading(true);
    try {
      Shop newShop = await shopRepository.getShopById(shopId);
      shop(newShop);
    } catch (e) {
      errorOccurred(true);
    }
    isLoading(false);
  }
}
