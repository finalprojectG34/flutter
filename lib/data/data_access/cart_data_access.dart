import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../src/app.dart';

class CartDataAccess {
  final GraphQLClient gqlClient;

  CartDataAccess({required this.gqlClient});

  Future<List<Cart>> getCart() async {
    final response = await gqlClient.query(
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
    );
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

  Future addToCart(Cart cart) async {
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
          "name": cart.name,
          "shopId": cart.shopId,
          "itemId": cart.itemId,
          "price": cart.price,
          "amount": cart.amount,
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
}
