import 'package:get/get.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/models/item_search_filter.dart';

import '../../../data/data_access/item_operation.dart';
import '../../../data/repository/item_repository.dart';

class SearchController extends GetxController {
  final ItemRepository itemRepository;
  final ItemOperation itemOperation;

  SearchController({required this.itemRepository, required this.itemOperation});

  RxBool isLoading = true.obs;
  RxMap<String, dynamic>? mockSearchItem = <String, dynamic>{}.obs;
  final items = Rx<List<Item>?>(null);

  Future<List<Item>?> getSearchItems(ItemSearchFilter itemSearchFilter) async {
    if (itemSearchFilter.reqPagInfo.pageNo < 2) {
      isLoading(true);
    }
    try {
      List<Item> result = await itemOperation.searchItem(itemSearchFilter);
      items.value = result;
      print(result);
      return result;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
    return null;
  }
}
