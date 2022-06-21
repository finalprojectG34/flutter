import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sms/data/repository/item_repository.dart';
import 'package:sms/data/repository/user_repository.dart';
import 'package:sms/src/models/item_history.dart';

import '../../app.dart';

class AppController extends GetxController {
  final ItemRepository itemRepository;
  final UserRepository userRepository;

  AppController({required this.itemRepository, required this.userRepository});

  final storage = Get.find<FlutterSecureStorage>();
  RxBool hasSearchIcon = true.obs;
  RxString pageName = 'Home'.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isSearchBarActive = false.obs;
  RxBool isAuthenticated = false.obs;
  RxBool isGettingItems = false.obs;
  RxBool getItemError = false.obs;
  RxBool gettingItemHistory = false.obs;
  RxString err = ''.obs;
  RxList<Item>? itemList;
  RxList<ItemHistoryModel>? itemHistory = <ItemHistoryModel>[].obs;
  FocusNode searchBarFocusNode = FocusNode();

  RxString userId = ''.obs;
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString phone = ''.obs;
  RxBool hasShopId = false.obs;
  RxString userRole = ''.obs;
  RxString userImageLink = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    String? value = await storage.read(key: 'token');
    if (value != null) {
      isAuthenticated(true);
      getUserInfo();
      await getUserShop();
      // await getShopId();
    }
    getItems();
  }

  getShopId() async {
    hasShopId(await storage.read(key: 'shopId') != null);
    if (hasShopId.isTrue) {}
    getMe();
    await getUserShop();
    // userRole(await storage.read(key: 'role'));

    // hasShopId(false);
    // userRole('SELLER');
    // userRole = 'SELLER';
    // hasShopId = true;
  }

  getUserShop() async {
    try {
      bool hasShop = await storage.read(key: "shopId") != null;
      String? role = await storage.read(key: "role");
      hasShopId(hasShop);
      userRole(role);
      // itemList!(items);
    } on TimeoutException catch (e) {
      err(e.message);
    } catch (e) {
      err('Some error occurred');
    }
    // categoryList!(categories.obs);
    // print(categoryList);
    // isCategoryFetchedFromDB(true);
  }

  getMe() async {
    try {
      User user = await userRepository.getMe();
      String? role = user.role;
      String? img = user.image;
      hasShopId(user.shopId != "" || user.shopId != null);
      if (role != null) {
        userRole(role);
      }
      if (img != null) {
        userImageLink(img);
      }
    } catch (e) {
      EasyLoading.showError('Some error happened',
          dismissOnTap: true, maskType: EasyLoadingMaskType.black);
    }
  }

  disableSearchIcon() {
    hasSearchIcon(false);
  }

  changePage(String name, int index) {
    pageName(name);
    selectedIndex(index);
  }

  Future<String?> imageUpload(File file) async {
    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child(userId.value + 'imgLink');

    try {
      await mountainsRef.putFile(file);
      return await mountainsRef.getDownloadURL();
    } on FirebaseException {
      Fluttertoast.showToast(msg: "Uploading failed");
      return null;
    }
  }

  updateProfilePic(File file) async {
    String? tempImgLink = await imageUpload(file);
    bool? imgLink = await userRepository.updateProfile({
      "input": {
        "image": {"imageCover": tempImgLink}
      }
    });
    if (imgLink != null) {
      userImageLink(tempImgLink);
    }
  }

  getUserInfo() async {
    String? _id = await storage.read(key: 'userId');
    String? _firstName = await storage.read(key: 'firstName');
    String? _lastName = await storage.read(key: 'lastName');
    String? _phone = await storage.read(key: 'phone');

    userId(_id);
    firstName(_firstName);
    lastName(_lastName);
    phone(_phone);
    userImageLink(await storage.read(key: 'userImg'));
  }

  getItems() async {
    getItemError(false);
    isGettingItems(true);
    // List<Item> items = await itemRepository.getItems();
    try {
      List<Item> items = await itemRepository.getItems();
      itemList = items.obs;
      // itemList!(items);
    } on TimeoutException catch (e) {
      getItemError(true);
      err(e.message);
    } catch (e) {
      print(e);
      getItemError(true);
      err('Connection error');
    }
    isGettingItems(false);
  }

  getItemHistory(String id) async {
    gettingItemHistory(true);

    try {
      List<ItemHistoryModel> items = await itemRepository.getItemHistory(id);
      itemHistory!(items);
    } on TimeoutException catch (e) {
      getItemError(true);
      err(e.message);
    } catch (e) {
      print(e);
      getItemError(true);
      err('Connection error');
    }
    gettingItemHistory(false);
  }

  logout() async {
    await storage.deleteAll();
  }
}
