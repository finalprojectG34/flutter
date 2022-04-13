import 'package:meta/meta.dart';
import 'package:sms/src/packages/data_provider/data_provider.dart';
import 'package:sms/src/models/models.dart';

class CategoryRepository {
  final CategoryDataProvider dataProvider;

  CategoryRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Category> createCategory(Category category) async {
    return await dataProvider.createCategory(category);
  }

  Future<List<Category>> getCategory() async {
    return await dataProvider.getCategories();
  }

  Future<void> updateCategory(Category category) async {
    await dataProvider.updateCategory(category);
  }

  Future<void> deleteCategory(String id) async {
    await dataProvider.deleteCategory(id);
  }
}
