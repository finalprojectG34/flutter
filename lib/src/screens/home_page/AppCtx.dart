import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sms/data/repository/item_repository.dart';

import '../../app.dart';

class AppController extends GetxController {
  final ItemRepository itemRepository;

  AppController({required this.itemRepository});

  final storage = Get.find<FlutterSecureStorage>();
  RxBool hasSearchIcon = true.obs;
  RxString pageName = 'Home'.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isSearchBarActive = false.obs;
  RxBool isAuthenticated = false.obs;
  RxBool isGettingItems = false.obs;
  RxBool getItemError = false.obs;
  RxString err = ''.obs;
  RxList<Item>? itemList;
  FocusNode searchBarFocusNode = FocusNode();

  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString phone = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    String? value = await storage.read(key: 'token');
    if (value != null) {
      isAuthenticated(true);
    }
    getItems();
    getUserInfo();
  }

  disableSearchIcon() {
    hasSearchIcon(false);
  }

  changePage(String name, int index) {
    pageName(name);
    selectedIndex(index);
  }

  getUserInfo() async {
    firstName((await storage.read(key: 'firstName')));
    lastName((await storage.read(key: 'lastName')));
    phone((await storage.read(key: 'phone')));
  }

  getItems() async {
    getItemError(false);
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
      err('Connection error');
    }
    isGettingItems(false);
  }

  logout() async {
    await storage.deleteAll();
  }
}
