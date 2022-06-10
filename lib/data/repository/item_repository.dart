import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sms/data/data_access/item_operation.dart';

import '../../src/app.dart';

class ItemRepository {
  final ItemOperation itemOperation;

  ItemRepository({required this.itemOperation});

  final storage = const FlutterSecureStorage();

  Future<List<Item>> getItems() async {
    return itemOperation.getItems();
  }

  Future<List<Category>> getCategory() async {
    return itemOperation.getCategory();
  }

  Future<Item> addItem(variable) async {
    return itemOperation.addItem(variable);
  }
}
