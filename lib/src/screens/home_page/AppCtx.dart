import 'package:get/get.dart';
import 'package:sms/data/repository/item_repository.dart';

import '../../app.dart';

class AppController extends GetxController {
  RxBool hasSearchIcon = true.obs;
  RxString pageName = 'Home'.obs;
  RxInt selectedIndex = 0.obs;
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
}
