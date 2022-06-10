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

  Future<bool> getUserShop(String userId) async {
    final response = await gqlClient
        .query(
      QueryOptions(
        document: gql(r'''
          query GetCompanyByUserId($getCompanyByUserIdId: ID) {
              getCompanyByUserId(id: $getCompanyByUserIdId) {
                id
              }
          }
  '''),
      ),
    )
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });
    print((response.data!['getCompanyByUserId'] as List));
    return (response.data!['getCompanyByUserId'] as List).isNotEmpty;
  }

  Future<List<Cart>> getCart() async {
    final response = await gqlClient
        .query(
      QueryOptions(document: gql(r'''
            query GetCartByUserId($getCartByUserIdId: ID) {
              getCartByUserId(id: $getCartByUserIdId) {
                id
                itemId
                name
                amount
                price
                status
                userId
                shopId
                deliveryAddress
              }
            }
      ''')),
    )
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });
    if (response.hasException) {
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      print(response.exception);
      // throw response.exception;
    } else {
      print("rrrrrrrrrrrrrrrrrrrrrrrrr");
      print(response);
    }
    return (response.data!['getCartByUserId'] as List)
        .map((json) => Cart.fromJson(json))
        .toList();
  }

  Future addToCart(name, shopId, itemId, price, amount) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation Mutation($input: CartItemsInput!) {
              addToCart(input: $input) {
                id
              }
            }
      '''),
      variables: {
        "input": {
          "name": name,
          "shopId": shopId,
          "itemId": itemId,
          "price": price,
          "amount": amount,
          "deliveryAddress": "alembank"
        }
      },
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    if (response.hasException) {
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      print(response.exception);
      // throw response.exception;
    } else {
      print("rrrrrrrrrrrrrrrrrrrrrrrrr");
      print(response);
    }
  }

  Future deleteCart(cartId) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation Mutation($deleteCartId: ID!) {
              deleteCart(id: $deleteCartId) {
                id
              }
            }
      '''),
      variables: {"deleteCartId": cartId},
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    if (response.hasException) {
      // throw response.exception;
    } else {}
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
