import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sms/src/models/models.dart';
import 'package:sms/src/utils/Constants.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

class CategoryDataProvider {

  final _baseUrl = Constants.ApiUrl;

  final http.Client httpClient;

  CategoryDataProvider({@required this.httpClient})
      : assert(httpClient != null);

  Future<Category> createCategory(Category category) async {

    logTrace("insede create");
    var postUri = Uri.parse('$_baseUrl/categories');
    var request = new http.MultipartRequest("POST", postUri);

    request.fields['name'] = category.name;
    request.fields['description'] = category.description;

    final response = await request.send();
    var a = await response.stream.bytesToString();
    final jsonResp = jsonDecode(a);

    logTrace("response ==", jsonResp);
    logTrace("statusCode ", response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Category.fromJson(jsonResp);
    } else {
      throw Exception('Failed to create category.');
    }
  }

  Future<List<Category>> getCategories() async {
    // logTrace("before get categories req");

    final response =
        await httpClient.get('$_baseUrl/categories?limit=10&offset=1');

    print(response.statusCode);
    // logTrace("responseStatus", response.statusCode);

    if (response.statusCode == 200) {
      final categories = jsonDecode(response.body) as List;
      // logTrace("categories list", response.statusCode);
      final categoryClass =
          categories.map((category) => Category.fromJson(category)).toList();
      // logTrace("category Class", categoryClass);
      return categoryClass;
    } else {
      logTrace("err");
      throw Exception('Failed to load category');
    }
  }

  Future<void> deleteCategory(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/categories/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete item.');
    }
  }

  Future<void> updateCategory(Category category) async {
    print(category.name);
    logTrace("category", category);

    var postUri = Uri.parse('$_baseUrl/categories/update/${category.id}');
    var request = new http.MultipartRequest("PUT", postUri);

    request.fields['name'] = category.name;
    request.fields['description'] = category.description;

    final response = await request.send();
    var a = await response.stream.bytesToString();
    final jsonResp = jsonDecode(a);

    logTrace("response ==", jsonResp);
    logTrace("statusCode ", response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Category.fromJson(jsonResp);
    } else {
      throw Exception('Failed to create category.');
    }
  }
}
