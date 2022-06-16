import 'package:get/get.dart';

import '../../../data/data_access/item_operation.dart';
import '../../../data/repository/item_repository.dart';

class SearchController extends GetxController {
  final ItemRepository itemRepository;
  final ItemOperation itemOperation;

  SearchController({required this.itemRepository, required this.itemOperation});

  RxBool isLoading = false.obs;
  RxMap<String, dynamic>? mockSearchItem = <String, dynamic>{}.obs;

  getMockSearchItems() async {
    isLoading(true);
    Map<String, dynamic> result = await itemOperation.getMockSearchItems();
    mockSearchItem!(result);
    print('$mockSearchItem  pppppppppppppppppppppppppppppp');
    isLoading(false);
    // print('mock $mockCategory');
    // return a;
  }
}
