import 'package:get/get.dart';

import '../../../data/database_operations/item_operation.dart';

class SearchController extends GetxController {
  RxBool isLoading = false.obs;
  RxMap<String, dynamic>? mockSearchItem = <String, dynamic>{}.obs;

  getMockSearchItems() async {
    isLoading(true);
    ItemOperation itemOperation = ItemOperation();
    Map<String, dynamic> result = await itemOperation.getMockSearchItems();
    mockSearchItem!(result);
    print('$mockSearchItem  pppppppppppppppppppppppppppppp');
    isLoading(false);
    // print('mock $mockCategory');
    // return a;
  }
}
