import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/mock/mock_category.dart';
import 'package:sms/src/models/item_history.dart';
import 'package:sms/src/models/item_search_filter.dart';

import '../../src/app.dart';
import '../../src/models/shop.dart';

class ItemOperation {
  final GraphQLClient gqlClient;

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
              image {
                imageCover
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

  Future<List<ItemHistoryModel>> getItemHistory(String id) async {
    String getAllItems = r'''
          query Query($getItemHistoryId: String!) {
            getItemHistory(id: $getItemHistoryId) {
              prevOwner
              modified {
                field
                value
              }
              transferDate
            }
          }
        ''';
    final response = await gqlClient
        .query(
      QueryOptions(
          document: gql(getAllItems),
          fetchPolicy: FetchPolicy.noCache,
          variables: {"getItemHistoryId": id}),
    )
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });

    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }

    return (response.data!['getItemHistory'] as List)
        .map((json) => ItemHistoryModel.fromJson(json))
        .toList();
  }

  Future<List<Category>> getCategory() async {
    String getAllCategory = r'''
          query GetCategoriesByPrefix($getCategoriesByPrefixId: ID) {
              getCategoriesByPrefix(id: $getCategoriesByPrefixId) {
                id
                name
                haveSubCtg
              }
}
  ''';
    final response = await gqlClient.query(
      QueryOptions(
          document: gql(getAllCategory),
          fetchPolicy: FetchPolicy.noCache,
          variables: {"getCategoriesByPrefixId": ""}),
    );
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    return (response.data!['getCategoriesByPrefix'] as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }

  Future<List<Category>> getOneCategory(String id) async {
    String getAllCategory = r'''
          query GetCategoriesByPrefix($getCategoriesByPrefixId: ID) {
              getCategoriesByPrefix(id: $getCategoriesByPrefixId) {
                id
                name
                haveSubCtg
              }
            }
  ''';
    final response = await gqlClient.query(
      QueryOptions(
          document: gql(getAllCategory),
          fetchPolicy: FetchPolicy.noCache,
          variables: {"getCategoriesByPrefixId": id}),
    );
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    return (response.data!['getCategoriesByPrefix'] as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }

  Future<Category> getCategoryDetail(String id) async {
    String getAllCategory = r'''
          query GetOneCategory($getOneCategoryId: String!) {
          getOneCategory(id: $getOneCategoryId) {
            id
            slug
            name
            image {
              imageCover
            }
            poster
            description
            path
            parentId
            attributes {
              name
              display
              values
            }
            subCategories {
              id
              slug
              name
              image {
                imageCover
              }
              poster
              description
              path
              parentId
              attributes {
                name
                display
                values
              }
             
            }
          }
        }
  ''';
    final response = await gqlClient.query(
      QueryOptions(
          document: gql(getAllCategory),
          fetchPolicy: FetchPolicy.noCache,
          variables: {"getOneCategoryId": id}),
    );
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    return Category.fromJson(response.data!['getOneCategory']);
  }

  // Future<bool> getUserShop(String userId) async {
  //   final response = await gqlClient
  //       .query(
  //     QueryOptions(
  //       document: gql(r'''
  //        query MyCompany {
  //           MyCompany {
  //             id
  //             name
  //           }
  //       }
  // '''),
  //       fetchPolicy: FetchPolicy.noCache,
  //     ),
  //   )
  //       .timeout(Duration(seconds: 30), onTimeout: () {
  //     throw TimeoutException('request timed out', const Duration(seconds: 30));
  //   });
  //   if (response.hasException) {
  //     print(response.exception);
  //     throw Exception("Error Happened");
  //   }
  //   // print((response.data!['getCompanyByUserId'] as List));
  //   return response.data!['MyCompany']!= null ;
  // }

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

  Future addToCart(String itemId) async {
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
          "itemId": [itemId]
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
            "limit": query.reqPagInfo.limit,
            "pageNo": query.reqPagInfo.pageNo
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

    final response = await gqlClient.mutate(MutationOptions(
      document: gql(addItemMutation),
      variables: variable,
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
}
