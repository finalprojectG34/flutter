import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../data/data_access/item_operation.dart';
import '../../../data/repository/item_repository.dart';

class SearchController extends GetxController {
  final ItemRepository itemRepository;

  SearchController({required this.itemRepository});

  final GraphQLClient _gqlClient = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink("http://192.168.0.172:8000/graphql"));

  RxBool isLoading = false.obs;
  RxMap<String, dynamic>? mockSearchItem = <String, dynamic>{}.obs;

  getMockSearchItems() async {
    isLoading(true);
    ItemOperation itemOperation = ItemOperation(gqlClient: _gqlClient);
    Map<String, dynamic> result = await itemOperation.getMockSearchItems();
    mockSearchItem!(result);
    print('$mockSearchItem  pppppppppppppppppppppppppppppp');
    isLoading(false);
    // print('mock $mockCategory');
    // return a;
  }
}
