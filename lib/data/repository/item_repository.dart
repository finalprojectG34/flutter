import 'package:sms/data/data_access/item_operation.dart';
import 'package:sms/src/models/item_history.dart';
import 'package:sms/src/models/shop.dart';

import '../../src/app.dart';

class ItemRepository {
  final ItemOperation itemOperation;

  ItemRepository({required this.itemOperation});

  Future<List<Item>> getItems() async {
    return itemOperation.getItems();
  }

  Future<List<ItemHistoryModel>> getItemHistory(String id) async {
    return itemOperation.getItemHistory(id);
  }

  Future<List<Item>> getFlashSaleItems(int pageIndex, int pageSize) async {
    // return itemOperation.getItems();
    return getMockItems();
  }

  Future<List<Category>> getCategory() async {
    return itemOperation.getCategory();
  }

  Future<List<Category>> getOneCategory(String id) async {
    return itemOperation.getOneCategory(id);
  }

  Future<Category> getCategoryDetail(String id) async {
    return itemOperation.getCategoryDetail(id);
  }

  // Future<bool> getUserShop(String userId) async {
  //   return itemOperation.getUserShop(userId);
  // }

  Future<Item> addItem(variable) async {
    return itemOperation.addItem(variable);
  }

  Future<Shop> addShop({name, description, subCity, city, imageCover}) async {
    return itemOperation.addShop(
      name: name,
      description: description,
      subCity: subCity,
      city: city,
      imageCover: imageCover,
    );
  }

  Future<List<Item>> getMockItems() {
    return Future.delayed(const Duration(seconds: 4), () {
      return List.generate(30, (i) {
        return Item(
            id: "$i",
            category: "Food",
            imagePath:
                "https://www.shutterstock.com/image-photo/young-student-watching-lesson-online-studying-1676998306",
            name: "Item $i",
            description: "Shop $i sells shoes",
            price: "",
            shopId: "1");
      });
    });
  }
}
