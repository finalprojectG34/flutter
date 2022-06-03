import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sms/data/repository/item_repository.dart';

import '../../app.dart';

class AppController extends GetxController {
  final storage = const FlutterSecureStorage();
  RxBool hasSearchIcon = true.obs;
  RxString pageName = 'Home'.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isSearchBarActive = false.obs;
  RxBool isAuthenticated = false.obs;
  String query = '''
  query GetAllItems{
  getAllItems{
    id
    name
  }
}
  ''';

  RxList<Item>? itemList;
  ItemRepository itemRepository = ItemRepository();

  @override
  void onInit() async {
    super.onInit();

    String? value = await storage.read(key: 'token');
    if (value != null) {
      isAuthenticated(true);
    }
  }

  disableSearchIcon() {
    hasSearchIcon(false);
  }

  changePage(String name, int index) {
    pageName(name);
    selectedIndex(index);
  }

  getItems(String query) async {
    List<Item> items = await itemRepository.getItems(query);
    itemList = items.obs;
  }

  logout() async {
    await storage.delete(key: 'token');
  }
}
