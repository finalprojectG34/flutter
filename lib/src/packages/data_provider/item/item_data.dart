import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sms/src/app.dart';
import 'package:sms/src/models/models.dart';
import 'package:sms/src/utils/Constants.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

class ItemDataProvider {

  final _baseUrl = Constants.ApiUrl;

  final http.Client httpClient;


  ItemDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Item>> getItems(int page, String category) async {
    // logTrace("before req");

    http.Response response;
    if(category==null){
      try{

        response = await httpClient.get('$_baseUrl/items/filter?limit=5&offsetValue=$page');
      }catch(e){

         print(e.toString());
      }
    }else{
      response= await httpClient.get('$_baseUrl/items?limit=5&page=$page/&category=$category');
    }

    // logTrace("responseStatus", response.statusCode);


    if (response.statusCode == 200) {
      final items = jsonDecode(response.body) as List;
      if(items==null){
        return [];
      }
      final itemClass = items.map((item) => Item.fromJson(item)).toList();

      // logTrace("items class", itemClass);
      return itemClass;
    } else {
      logTrace("err");
      // throw Exception('Failed to load items');
    }
  }

  Future<Item> createItem(Item item) async {
    // logTrace("inside create");
    var postUri = Uri.parse('$_baseUrl/items');
    var request = new http.MultipartRequest("POST", postUri);
    request.headers["Token"]=AuthDataProvider.token;

    request.fields['name'] = item.name;
    // request.fields['name'] = item.name;
    request.fields['description'] = item.description;
    request.fields['category'] = "food";
    request.fields['price'] = item.price;
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      item.imagePath,
    ));

    final response = await request.send();

    var a = await response.stream.bytesToString();
    final jsonResp = jsonDecode(a);

    logTrace("response ==", jsonResp);

    if (response.statusCode == 200 || response.statusCode == 201) {
    logTrace("statusCode ", response.statusCode);

      return Item.fromJson(jsonResp);

    } else {
      throw Exception('Failed to create item.');
    }
  }

  Future<void> updateItem(Item item) async {
    var postUri = Uri.parse('$_baseUrl/items/update/${item.id}');
    var request = new http.MultipartRequest("PUT", postUri);
    request.headers["Token"]=AuthDataProvider.token;

    request.fields['name'] = item.name;

    request.fields['description'] = item.description;
    request.fields['category'] = "food";
    request.fields['price'] =item.price;

    request.files.add(await http.MultipartFile.fromPath(
      'image',
      item.imagePath,
    ));
    logTrace("key",item);
    logTrace("key",postUri);

    try{
    final response = await request.send();

    var a = await response.stream.bytesToString();
    final jsonResp = jsonDecode(a);



    if (response.statusCode == 200 || response.statusCode == 201|| response.statusCode == 202) {
      return Item.fromJson(jsonResp);
    } else {
      throw Exception('Failed to update item.');
    }

    }catch(e){
      logTrace("eee", e);
    }
  }

  Future<void> deleteItem(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/items/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    logTrace("key", response.statusCode);

    if (response.statusCode != 204) {
      throw Exception('Failed to delete item.');
    }
  }
}
