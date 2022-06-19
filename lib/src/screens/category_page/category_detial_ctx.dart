import 'package:get/get.dart';
import 'package:sms/data/data_access/item_operation.dart';

import '../../models/item_search_filter.dart';
import '../../models/models.dart';

class CategoryDetailController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var itemList = Rx<List<Item>?>(null);
  final ItemOperation itemOperation;

  CategoryDetailController({required this.itemOperation});

  Future<List<Item>?> getItemsByCatID(ItemSearchFilter filter) async {
    if (filter.reqPagInfo.pageNo < 1) {
      isLoading(true);
    }
    try {
      final items = await itemOperation.searchItem(filter);
      itemList.value = items;
      return items;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
    return null;
  }
}
