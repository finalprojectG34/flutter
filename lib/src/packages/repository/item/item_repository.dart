import 'package:meta/meta.dart';
import 'package:sms/src/packages/data_provider/data_provider.dart';
import 'package:sms/src/models/models.dart';

class ItemRepository {
  final ItemDataProvider dataProvider;

  ItemRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<Item> createItem(Item item) async {
    return await dataProvider.createItem(item);
  }

  Future<List<Item>> getItems(int page,String categoryName) async {
    return await dataProvider.getItems(page, categoryName);
  }

  Future<void> updateItem(Item item) async {
    await dataProvider.updateItem(item);
  }

  Future<void> deleteItem(String id) async {
    await dataProvider.deleteItem(id);
  }
}
