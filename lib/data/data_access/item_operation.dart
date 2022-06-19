import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/mock/mock_category.dart';
import 'package:sms/src/models/item_search_filter.dart';

import '../../src/app.dart';
import '../../src/models/shop.dart';

class ItemOperation {
  final GraphQLClient gqlClient;

  // AppController appController = Get.find();

  ItemOperation({required this.gqlClient});

  Future<List<Item>> getItems() async {
    String getAllItems = r'''
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
        ''';
    final response = await gqlClient
        .query(
      QueryOptions(
        document: gql(getAllItems),
        fetchPolicy: FetchPolicy.noCache,
      ),
    )
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });

    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }

    return (response.data!['getAllItems'] as List)
        .map((json) => Item.fromJson(json))
        .toList();
  }

  Future<List<Category>> getCategory() async {
    String getAllCategory = r'''
          query GetAllCategory{
          getAllCategories {
            id
            name  
          }
        }
  ''';
    final response = await gqlClient.query(
      QueryOptions(
        document: gql(getAllCategory),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
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
        fetchPolicy: FetchPolicy.noCache,
      ),
    )
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print((response.data!['getCompanyByUserId'] as List));
    return (response.data!['getCompanyByUserId'] as List).isNotEmpty;
  }

  Future<bool> updateProfile(variable) async {
    print(variable);
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation UpdateMe($input: UserUpdateInput) {
                  updateMe(input: $input) {
                    id
                    firstName
                    lastName
                    phone
                    image {
                        imageCover
                    }
              }
            }
      '''),
      variables: variable,
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print('responce $response');
    return (response.data!['updateMe']['id']) != null;
  }

  Future<bool> updatePassword(variable) async {
    // print(variable);
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation ChangePassword($input: changePwdInput) {
                changePassword(input: $input) {
                  id
               }
}
      '''),
      variables: variable,
    ));
    if (response.hasException) {
      for (var element in response.exception!.graphqlErrors) {
        if (element.message == 'User credentials not correct') {
          throw Exception("Incorrect old password");
        }
        // if (response.exception!.graphqlErrors[0].message ==
        //     'info or password wrong') {
        // throw Exception("Error Happened");
      }
      throw Exception("Error Happened");
    }
    // print('responce $response');
    return (response.data!['changePassword']['id']) != null;
  }

  Future<List<Cart>> getCart() async {
    final response = await gqlClient
        .query(
      QueryOptions(
        document: gql(r'''
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
      '''),
        fetchPolicy: FetchPolicy.noCache,
      ),
    )
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
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
        }
      },
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
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
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
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

  Future<List<Item>> searchItem(ItemSearchFilter query) async {
    final response = await gqlClient
        .query(
      QueryOptions(document: gql(r'''
            query searchItems($searchItemsInput2: ItemSearchFilter) {
                  searchItems(input: $searchItemsInput2) {
                  items {
                    name
                    description
                    price {
                      sale
                    }
                    
                  }
                  total
                }
              }
      '''), fetchPolicy: FetchPolicy.noCache, variables: {
        "searchItemsInput2": {
          "searchTerm": query.searchTerm,
          "minPrice": query.minPrice,
          "maxPrice": query.maxPrice,
          "attributes": [
            query.attributes != null && query.attributes!.isNotEmpty
                ? {
                    "name": query.attributes![0].name,
                    "values": query.attributes![0].values
                  }
                : null,
          ],
          "paginationInfo": {
            "limit": query.reqPagInfo?.limit,
            "pageNo": query.reqPagInfo?.pageNo
          }
        },
      }),
    )
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });
    if (response.hasException) {
      print("exception happened");
      print(response.exception);
      throw Exception("Error Happened");
    }
    print("search response");
    print(response);
    return (response.data!['searchItems']["items"] as List)
        .map((json) => Item.fromJson(json))
        .toList();
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

    final response = await gqlClient.query(QueryOptions(
      document: gql(addItemMutation),
      variables: {
        "input": {
          "name": "item 9",
          "description": {"description": "desc", "lang": "en"},
          "image":
              "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg",
          "categoryId": "cat id 9"
        },
      },
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
    return Item.fromJson(response.data!['createItem']);
  }

  Future<Shop> addShop({name, description, subCity, city, imageCover}) async {
    String addItemMutation = r'''
     mutation CreateCompany($input: CompanyInput!) {
        createCompany(input: $input) {
          id
          slug
          name
          ownerId
          status
          sellingCategories
        }
      }
      ''';

    final response = await gqlClient.query(QueryOptions(
      document: gql(addItemMutation),
      variables: {
        "input": {
          "name": name,
          "description": description,
          "address": {"subCity": subCity, "city": city},
          "image": {"imageCover": imageCover}
        }
      },
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
    return Shop.fromJson(response.data!['createCompany']);
  }

  Future<User> getMe() async {
    String queryGetMe = r'''
       query GetMe {
          getMe {
            id
            role
            image {
              imageCover
            }
            address {
                subCity
                city
                addressName
                country
            }
          }
      }
      ''';

    final response = await gqlClient.query(
      QueryOptions(
        document: gql(queryGetMe),
      ),
    );
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
    return User.fromJson(response.data!['getMe']);
  }
}
