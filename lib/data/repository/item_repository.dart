// import 'package:delivery_app_getx/core/services/gql_client.dart';
// import 'package:delivery_app_getx/core/services/http_client.dart';
// import 'package:delivery_app_getx/core/utils/urls.dart';
// import 'package:delivery_app_getx/features/order/data/documents/docs_gql.dart';
// import 'package:delivery_app_getx/features/order/data/models/order_model.dart';

import 'package:sms/data/database_operations/item_operation.dart';

import '../../src/app.dart';

class ItemRepository {
  ItemOperation itemOperation = ItemOperation();

  // Future<bool> createItem(Map<String, dynamic> body);
  Future<List<Item>> getItems(String query) async {
    return itemOperation.getItems(query);
  }

  Future<List<Category>> getCategory(String query) async {
    return itemOperation.getCategory(query);
  }

  Future<Item> addItem(variable) async {
    return itemOperation.addItem(variable);
  }

  Future<List<Cart>> getCart(String userId) async {
    return itemOperation.getCart(userId);
  }

  Future addToCart(String name, String shopId, String userId, String itemId,
      String price, String amount) async {
    await itemOperation.addToCart(name, shopId, userId, itemId, price, amount);
  }

  Future deleteCart(String cartId) async {
    await itemOperation.deleteCart(cartId);
  }
// Future<OrderModel> getOrder(int orderId);
}

// class OrderRespositoryImpl implements ItemRepository {
//   // final HttpClient _client;
//   final GraphQLClient _gqlClient;
//
//   OrderRespositoryImpl( this._gqlClient);
//   String query = '''
//   query GetAllCategories{
//   getAllCategories{
//     id
//     name
//   }
// }
//   ''';
//   // @override
//   // Future<bool> createOrder(Map<String, dynamic> body) async {
//   //   try {
//   //     await _client.post(URLs.orders, body: body, authorization: true);
//   //     return true;
//   //   } on Exception catch (e) {
//   //     throw e;
//   //   }
//   // }
//
//   @override
//   void getItems(query) async {
//
//     final response = await _gqlClient.queryManager.fetchQuery(
//         '1',
//         QueryOptions(
//           document: gql(query),
//         ));
//     print(response.data.toString() + ' aaa');
//     // return (response['data']['orders'] as List)
//     //     .map((json) => OrderModel.fromMap(json))
//     //     .toList();
//   }
//
// // @override
// // Future<OrderModel> getOrder(int orderId) async {
// //   _gqlClient.
// //   final response = await _gqlClient.connect
// //       .query(DocsGql.getOrder, variables: {'id': orderId});
// //
// //   return OrderModel.fromMap(response['data']['order']);
// // }
// }
