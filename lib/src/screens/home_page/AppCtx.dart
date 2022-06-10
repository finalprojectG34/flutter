import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sms/data/repository/item_repository.dart';

import '../../app.dart';

class AppController extends GetxController {
  final ItemRepository itemRepository;

  AppController({required this.itemRepository});

  final storage = const FlutterSecureStorage();
  RxBool hasSearchIcon = true.obs;
  RxString pageName = 'Home'.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isSearchBarActive = false.obs;
  RxBool isAuthenticated = false.obs;
  RxBool isGettingItems = false.obs;
  RxBool getItemError = false.obs;
  RxString err = ''.obs;
  RxList<Item>? itemList;

  @override
  void onInit() async {
    super.onInit();

    String? value = await storage.read(key: 'token');
    if (value != null) {
      isAuthenticated(true);
    }
    getItems();
  }

  disableSearchIcon() {
    hasSearchIcon(false);
  }

  changePage(String name, int index) {
    pageName(name);
    selectedIndex(index);
  }

  getItems() async {
    isGettingItems(true);
    // List<Item> items = await itemRepository.getItems();
    // itemList!(items);
    // isGettingItems(false);
    try {
      List<Item> items = await itemRepository.getItems();
      itemList = items.obs;
      // itemList!(items);
    } on TimeoutException catch (e) {
      getItemError(true);
      err(e.message);
    } catch (e) {
      getItemError(true);
      err('Some error occurred');
    }
    isGettingItems(false);
  }

  logout() async {
    await storage.delete(key: 'token');
  }
}
