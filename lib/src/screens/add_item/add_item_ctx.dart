import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sms/data/data_access/item_operation.dart';
import 'package:sms/src/models/models.dart';
import 'package:sms/src/screens/home_page/AppCtx.dart';

import '../../../data/repository/item_repository.dart';
import '../../models/shop.dart';

class AddItemController extends GetxController {
  final ItemRepository itemRepository;
  final ItemOperation itemOperation;
  AppController appController = Get.find();

  AddItemController(
      {required this.itemOperation, required this.itemRepository});

  RxBool isCategoryFetchedFromDB = false.obs;
  RxBool isSubCategoryFetchedFromDB = false.obs;
  RxList<Category>? categoryList = <Category>[].obs;
  RxList<Category>? subCategoryList = <Category>[].obs;

  RxString itemId = ''.obs;
  RxList attributes = [].obs;
  RxMap<String, String> selectedAttributes = <String, String>{}.obs;

  RxMap<String, dynamic>? mockCategory = <String, dynamic>{}.obs;
  RxInt categorySelectPages = 0.obs;
  RxBool isCategoryLoading = true.obs;
  List<String> tempCategories = [];
  RxList<String> selectedCategoryName = <String>[].obs;
  RxList<String> selectedCategoryId = <String>[].obs;
  RxBool? userHasShop;
  RxBool isShopLoading = false.obs;
  RxBool isTimedOut = false.obs;
  RxString err = ''.obs;
  RxBool shopImageErr = false.obs;
  RxBool addItemImageErr = false.obs;
  RxBool isShopAdding = false.obs;
  RxBool isItemAdding = false.obs;
  RxBool errOccurred = false.obs;
  RxString shopImageLink = ''.obs;
  RxString itemImageLink = ''.obs;

  RxString catId = ''.obs;
  RxString subCatId = ''.obs;

  Rx<Category> categoryDetail = Category().obs;

  // RxList categories = <Category>[].obs;
  final storage = Get.find<FlutterSecureStorage>();

  @override
  void onInit() async {
    super.onInit();
    await getUserShop();
    await getCategory();
  }

  getCategory() async {
    List<Category> categories = await itemRepository.getCategory();
    if (categories != null) {
      categoryList!(categories.obs);
    }

    print(categoryList);
    isCategoryFetchedFromDB(true);
  }

  getOneCategory(String id) async {
    isSubCategoryFetchedFromDB(false);
    List<Category> categories = await itemRepository.getOneCategory(id);
    if (categories != null) {
      subCategoryList!(categories.obs);
    }
    isSubCategoryFetchedFromDB(true);
  }

  getCategoryDetail(String id) async {
    isSubCategoryFetchedFromDB(false);
    Category catDetail = await itemRepository.getCategoryDetail(id);
    if (catDetail != null) {
      categoryDetail(catDetail);
    }
    isSubCategoryFetchedFromDB(true);
  }

  getUserShop() async {
    isShopLoading(true);
    errOccurred(false);
    try {
      bool hasShop = await itemRepository.getUserShop('');
      userHasShop = hasShop.obs;
      // itemList!(items);
    } on TimeoutException catch (e) {
      err(e.message);
      errOccurred(true);
    } catch (e) {
      err('Some error occurred');
      errOccurred(true);
    }

    isShopLoading(false);
    // categoryList!(categories.obs);
    // print(categoryList);
    // isCategoryFetchedFromDB(true);
  }

  getMockCategory() async {
    Map<String, dynamic> result = await itemOperation.getMockCategory();
    mockCategory!(result);
    isCategoryLoading(false);
    print('mock $mockCategory');
    // return a;
  }

  addItem(variable, File file) async {
    var imagePath = await imageUpload(file);
    print('$imagePath -----------------------');
    variable["image"]["imageCover"] = imagePath;
    variable["attributes"] = selectedAttributes.value;

    Item item = await itemRepository.addItem({"input": variable});
    itemId(item.id);
  }

  addShop({name, description, subCity, city, required File file}) async {
    isShopLoading(true);
    // logTrace('var', variable);
    var imagePath = await imageUpload(file);
    if (imagePath != null) {
      // variable['input']["image"]['imageCover'] = imagePath;

      try {
        Shop shop = await itemRepository.addShop(
          name: name,
          description: description,
          subCity: subCity,
          city: city,
          imageCover: imagePath,
        );
        if (shop != null) {
          // await .
          await storage.write(key: 'shopId', value: shop.id);
          appController.hasShopId(true);
          appController.changePage('Pending', 2);
          // await storage.write(key: 'userRole', value: 'PENDING');
          EasyLoading.showSuccess('Shop created successfully',
              dismissOnTap: true, maskType: EasyLoadingMaskType.black);
        }
      } catch (e) {
        EasyLoading.showError('Some error happened',
            dismissOnTap: true, maskType: EasyLoadingMaskType.black);
      }
    } else {
      shopImageErr(true);
    }
    isShopLoading(false);
    // // print('$imagePath -----------------------');

    // Item item = await itemRepository.addItem(variable);
    // itemId(item.id);
  }

  Future<String?> imageUpload(File file) async {
    // var storage = Get.find<FlutterSecureStorage>();
    // var userId = await storage.read(key: "userId");
    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child(appController.userId.value);

    try {
      await mountainsRef.putFile(file);
      return await mountainsRef.getDownloadURL();
    } on FirebaseException {
      Fluttertoast.showToast(msg: "Uploading failed");
      return null;
    }
  }

  addSelectedAttribute(String key, String value) {
    if (selectedAttributes.isEmpty) {
      // selectedAttributes.({key: value});
      selectedAttributes.addEntries(
        [
          MapEntry(
            key,
            value,
          ),
        ],
      );
    } else if (selectedAttributes.containsKey(key)) {
      selectedAttributes.update(key, (val) => value);
    } else {
      selectedAttributes.addEntries(
        [
          MapEntry(
            key,
            value,
          ),
        ],
      );
    }
    print('attrs ${selectedAttributes}');
  }

  changeAttribute(variable) {
    // attributes.clear();
    // attributes.
    // attributes = variable.obs;
    attributes(variable);
  }
}
