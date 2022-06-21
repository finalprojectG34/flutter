import 'package:graphql_flutter/graphql_flutter.dart';

import '../../src/app.dart';

class CartRepository {
  final GraphQLClient gqlClient;

  CartRepository({required this.gqlClient});

  Future<List<Cart>> getCart() async {
    final response = await gqlClient.query(
      QueryOptions(
        document: gql(r'''
            query Query {
              getUserCart {
                id
                cartItems {
                  id
                  name
                  price {
                    discountPrice
                    sale
                  }
                  image {
                    imageCover
                  }
                  shopId
                }
              }
            }
      '''),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
    return (response.data!['getUserCart']['cartItems'] as List)
        .map((json) => Cart.fromJson(json))
        .toList();
  }

  Future addToCart(Cart cart) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation Mutation($input: UserAddToCartInput) {
              addToCart(input: $input) {
                id
              }
            }
      '''),
      variables: {
        "input": {
          "itemId": cart.id,
        }
      },
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    } else {
      return true;
    }

    print(response);
  }

  Future deleteCart(cartId) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation DeleteFromCart($input: UserDeleteFromCartInput) {
                deleteFromCart(input: $input) {
                  id
                  firstName
                }
            }
      '''),
      variables: {
        "input": {"itemId": cartId.toString()}
      },
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    return true;
  }
}
