import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../data/data_access/item_operation.dart';
import '../../app.dart';
import '../../models/item_search_filter.dart';

class MyItemsController extends GetxController {
  final ItemOperation itemOperation;

  MyItemsController({required this.itemOperation});

  var isLoading = true.obs;
  final items = Rx<List<Item>?>(null);
  var itemSearchFilter;

  @override
  onInit() async {
    super.onInit();
    final item = Get.find<FlutterSecureStorage>();
    String? userId = await item.read(key: "userId");
    itemSearchFilter =
        ItemSearchFilter(reqPagInfo: ReqPagInfo(), ownerId: userId);
    getSearchItems();
  }

  getSearchItems() async {
    isLoading(true);
    try {
      List<Item> result = await itemOperation.searchItem(itemSearchFilter);
      items.value = result;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
    return null;
  }
}
