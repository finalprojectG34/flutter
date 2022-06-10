import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/mock/mock_category.dart';

import '../../src/app.dart';

class ItemOperation {
  final GraphQLClient gqlClient;

  ItemOperation({required this.gqlClient});

  Future<List<Item>> getItems() async {
    final response = await gqlClient
        .query(
      QueryOptions(
        document: gql(r'''
          query GetAllItems {
            getAllItems {
              id
              name
              description
              price {
                sale
                discountPrice
              }
              shopId
              count
            }
          }
        '''),
      ),
    )
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });

    if (response.hasException) {
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      print(response.exception);
    }

    return (response.data!['getAllItems'] as List)
        .map((json) => Item.fromJson(json))
        .toList();
  }

  Future<List<Category>> getCategory() async {
    final response = await gqlClient.query(
      QueryOptions(document: gql(r'''
          query GetAllCategory{
          getAllCategories {
            id
            name  
          }
        }
  ''')),
    );
    return (response.data!['getAllCategories'] as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }

  Future<Map<String, dynamic>> getMockCategory() async {
    return Future.delayed(const Duration(seconds: 1),
        () => {"getAllCategories": mockAllCategories});
  }

  Future<Map<String, dynamic>> getMockSearchItems() async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => mockCategory,
    );
  }

  Future<Item> addItem(variable) async {
    String addItemMutation = r'''
     mutation CreateItem($input: ItemCreateInput!) {
        createItem(input: $input) {
          id
          name
          
        }
      }
      ''';

    final response = await gqlClient
        .query(QueryOptions(document: gql(addItemMutation), variables: {
      "input": {
        "name": "item 9",
        "description": {"description": "desc", "lang": "en"},
        "image":
            "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg",
        "categoryId": "cat id 9"
      },
    }));
    print(response);
    return Item.fromJson(response.data!['createItem']);
  }
}
