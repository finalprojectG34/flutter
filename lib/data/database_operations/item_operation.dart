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
            }
          }
        '''),
      ),
    )
        .timeout(const Duration(seconds: 5), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 20));
    });
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

  Future<List<Cart>> getCart(userId) async {
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
      '''), variables: {"getCartByUserIdId": userId}),
    );
    return (response.data!['getCartByUserId'] as List)
        .map((json) => Cart.fromJson(json))
        .toList();
  }

  Future addToCart(name, shopId, userId, itemId, price, amount) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation Mutation($input: CartItemsInput!) {
              addToCart(input: $input) {
                id
                itemId
                name
                price
                amount
                status
                userId
                shopId
                deliveryAddress
              }
            }
      '''),
      variables: {
        "input": {
          "name": name,
          "userId": userId,
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
      // throw response.exception;
    } else {}
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
    return Future.delayed(
        const Duration(seconds: 1),
            () => {
          "getAllCategories": [
            {
              "id": "612e17f2443a71e64c66c7aa",
              "name": "electronics",
              "attributes": [
                {
                  "slug": "condition",
                  "name": "condition",
                  "display": "dropdown",
                  "categoryIds": [
                    "612e17f2443a71e64c66c7aa",
                    "612e17f2443a71e64c66c7bb",
                    "612e17f2443a71e64c66c7cc"
                  ],
                  "isRequired": true,
                  "options": ["new", "used", "almost new", "used abroad"],
                  "currentData": [
                    {"value": "new", "count": 20},
                    {"value": "used", "count": 25},
                  ]
                },
              ],
              "count": 50,
              "slug": "electronics",
              "isCreatable": true,
              "hasSubcategory": true,
              "subCategories": [
                {
                  "name": "computers and laptops",
                  "id": "612e17f2443a71e64c66c7bb",
                  "isCreatable": true,
                  "hasSubcategory": true,
                  "subCategories": [
                    {
                      "name": "dell",
                      "id": "612e17f2443a71e64c66c7bx",
                      "isCreatable": true,
                      "hasSubcategory": true,
                      "subCategories": [
                        {
                          "name": "dell type 1",
                          "id": "612e17f2443a71e64c66c7bx",
                          "isCreatable": true,
                          "hasSubcategory": false,
                          "subCategories": [],
                          "attributes": [
                            {
                              "slug": "ram",
                              "name": "ram",
                              "categoryIds": ["612e17f2443a71e64c66c7bb"],
                              "display": "number",
                              "isRequired": true,
                              "options": ["4", "6", "12", "16", "32"],
                              "currentData": [
                                {
                                  "value": "4",
                                  "count": 15,
                                },
                                {
                                  "value": "8",
                                  "count": 20,
                                },
                              ],
                              "subAttributes": [
                                {
                                  "name": "ram type",
                                  "options": ["ddr3", "ddr4"]
                                }
                              ]
                            },
                            {
                              "slug": "internal-hard-disk",
                              "name": "internal hard disk",
                              "display": "number",
                              "categoryIds": ["612e17f2443a71e64c66c7bb"],
                              "isRequired": true,
                              "options": [
                                "8",
                                "16",
                                "32",
                                "64",
                                "128",
                                "256",
                                "500"
                              ],
                              "currentData": [
                                {"value": "128", "count": 15},
                                {"value": "256", "count": 29},
                                {"value": "500", "count": 60},
                              ],
                              "modifiers": ["ssd sata", "hdd", "ssd nvme"],
                            },
                            {
                              "slug": "color",
                              "name": "color",
                              "display": "text",
                              "categoryIds": [
                                "612e17f2443a71e64c66c7cc",
                                "612e17f2443a71e64c66c7bb"
                              ],
                              "isRequired": false,
                              "options": ["red", "blue", "black"],
                              "currentData": [
                                {"value": "blue", "count": 15},
                                {"value": "black", "count": 25},
                              ]
                            },
                            {
                              "slug": "condition",
                              "name": "condition",
                              "display": "dropdown",
                              "categoryIds": [
                                "612e17f2443a71e64c66c7aa",
                                "612e17f2443a71e64c66c7bb",
                                "612e17f2443a71e64c66c7cc"
                              ],
                              "isRequired": true,
                              "options": [
                                "new",
                                "used",
                                "almost new",
                                "used abroad"
                              ],
                              "currentData": [
                                {"value": "new", "count": 20},
                                {"value": "used", "count": 25},
                              ]
                            },
                          ],
                          "ancestors": ["612e17f2443a71e64c66c7aa"],
                          "count": 3,
                          "slug": "mobile-phones",
                          "parentId": "612e17f2443a71e64c66c7aa",
                          "image": "default.png",
                        },
                        {
                          "name": "dell type 2",
                          "id": "612e17f2443a71e64c66c7bx",
                          "isCreatable": true,
                          "hasSubcategory": false,
                          "subCategories": [],
                          "attributes": [
                            {
                              "slug": "ram",
                              "name": "ram",
                              "categoryIds": ["612e17f2443a71e64c66c7bb"],
                              "display": "",
                              "isRequired": true,
                              "options": ["4", "6", "12", "16", "32"],
                              "currentData": [
                                {
                                  "value": "4",
                                  "count": 15,
                                },
                                {
                                  "value": "8",
                                  "count": 20,
                                },
                              ],
                              "subAttributes": [
                                {
                                  "name": "ram type",
                                  "options": ["ddr3", "ddr4"]
                                }
                              ]
                            },
                            {
                              "slug": "internal-hard-disk",
                              "name": "internal hard disk",
                              "categoryIds": ["612e17f2443a71e64c66c7bb"],
                              "isRequired": true,
                              "options": [
                                "8",
                                "16",
                                "32",
                                "64",
                                "128",
                                "256",
                                "500"
                              ],
                              "currentData": [
                                {"value": "128", "count": 15},
                                {"value": "256", "count": 29},
                                {"value": "500", "count": 60},
                              ],
                              "display": "ComboBox",
                              "modifiers": ["ssd sata", "hdd", "ssd nvme"],
                            },
                            {
                              "slug": "color",
                              "name": "color",
                              "categoryIds": [
                                "612e17f2443a71e64c66c7cc",
                                "612e17f2443a71e64c66c7bb"
                              ],
                              "isRequired": false,
                              "options": ["red", "blue", "black"],
                              "currentData": [
                                {"value": "blue", "count": 15},
                                {"value": "black", "count": 25},
                              ]
                            },
                            {
                              "slug": "condition",
                              "name": "condition",
                              "categoryIds": [
                                "612e17f2443a71e64c66c7aa",
                                "612e17f2443a71e64c66c7bb",
                                "612e17f2443a71e64c66c7cc"
                              ],
                              "isRequired": true,
                              "options": [
                                "new",
                                "used",
                                "almost new",
                                "used abroad"
                              ],
                              "currentData": [
                                {"value": "new", "count": 20},
                                {"value": "used", "count": 25},
                              ]
                            },
                          ],
                          "ancestors": ["612e17f2443a71e64c66c7aa"],
                          "count": 3,
                          "slug": "mobile-phones",
                          "parentId": "612e17f2443a71e64c66c7aa",
                          "image": "default.png",
                        },
                      ],
                      "attributes": [
                        {
                          "slug": "ram",
                          "name": "ram",
                          "display": "number",
                          "categoryIds": ["612e17f2443a71e64c66c7bb"],
                          "isRequired": true,
                          "options": ["4", "6", "12", "16", "32"],
                          "currentData": [
                            {
                              "value": "4",
                              "count": 15,
                            },
                            {
                              "value": "8",
                              "count": 20,
                            },
                          ],
                          "subAttributes": [
                            {
                              "name": "ram type",
                              "options": ["ddr3", "ddr4"]
                            }
                          ]
                        },
                        {
                          "slug": "internal-hard-disk",
                          "name": "internal hard disk",
                          "display": "number",
                          "categoryIds": ["612e17f2443a71e64c66c7bb"],
                          "isRequired": true,
                          "options": [
                            "8",
                            "16",
                            "32",
                            "64",
                            "128",
                            "256",
                            "500"
                          ],
                          "currentData": [
                            {"value": "128", "count": 15},
                            {"value": "256", "count": 29},
                            {"value": "500", "count": 60},
                          ],
                          "modifiers": ["ssd sata", "hdd", "ssd nvme"],
                        },
                        {
                          "slug": "color",
                          "name": "color",
                          "display": "text",
                          "categoryIds": [
                            "612e17f2443a71e64c66c7cc",
                            "612e17f2443a71e64c66c7bb"
                          ],
                          "isRequired": false,
                          "options": ["red", "blue", "black"],
                          "currentData": [
                            {"value": "blue", "count": 15},
                            {"value": "black", "count": 25},
                          ]
                        },
                        {
                          "slug": "condition",
                          "name": "condition",
                          "display": "dropdown",
                          "categoryIds": [
                            "612e17f2443a71e64c66c7aa",
                            "612e17f2443a71e64c66c7bb",
                            "612e17f2443a71e64c66c7cc"
                          ],
                          "isRequired": true,
                          "options": [
                            "new",
                            "used",
                            "almost new",
                            "used abroad"
                          ],
                          "currentData": [
                            {"value": "new", "count": 20},
                            {"value": "used", "count": 25},
                          ]
                        },
                      ],
                      "ancestors": ["612e17f2443a71e64c66c7aa"],
                      "count": 3,
                      "slug": "mobile-phones",
                      "parentId": "612e17f2443a71e64c66c7aa",
                      "image": "default.png",
                    },
                    {
                      "name": "hp",
                      "id": "612e17f2443a71e64c66c7bs",
                      "isCreatable": true,
                      "hasSubcategory": false,
                      "subCategories": [],
                      "attributes": [
                        {
                          "slug": "ram",
                          "name": "ram",
                          "display": "number",
                          "categoryIds": ["612e17f2443a71e64c66c7bb"],
                          "isRequired": true,
                          "options": ["4", "6", "12", "16", "32"],
                          "currentData": [
                            {
                              "value": "4",
                              "count": 15,
                            },
                            {
                              "value": "8",
                              "count": 20,
                            },
                          ],
                          "subAttributes": [
                            {
                              "name": "ram type",
                              "options": ["ddr3", "ddr4"]
                            }
                          ]
                        },
                        {
                          "slug": "internal-hard-disk",
                          "name": "internal hard disk",
                          "display": "number",
                          "categoryIds": ["612e17f2443a71e64c66c7bb"],
                          "isRequired": true,
                          "options": [
                            "8",
                            "16",
                            "32",
                            "64",
                            "128",
                            "256",
                            "500"
                          ],
                          "currentData": [
                            {"value": "128", "count": 15},
                            {"value": "256", "count": 29},
                            {"value": "500", "count": 60},
                          ],
                          "modifiers": ["ssd sata", "hdd", "ssd nvme"],
                        },
                        {
                          "slug": "color",
                          "name": "color",
                          "display": "text",
                          "categoryIds": [
                            "612e17f2443a71e64c66c7cc",
                            "612e17f2443a71e64c66c7bb"
                          ],
                          "isRequired": false,
                          "options": ["red", "blue", "black"],
                          "currentData": [
                            {"value": "blue", "count": 15},
                            {"value": "black", "count": 25},
                          ]
                        },
                        {
                          "slug": "condition",
                          "name": "condition",
                          "display": "dropdown",
                          "categoryIds": [
                            "612e17f2443a71e64c66c7aa",
                            "612e17f2443a71e64c66c7bb",
                            "612e17f2443a71e64c66c7cc"
                          ],
                          "isRequired": true,
                          "options": [
                            "new",
                            "used",
                            "almost new",
                            "used abroad"
                          ],
                          "currentData": [
                            {"value": "new", "count": 20},
                            {"value": "used", "count": 25},
                          ]
                        },
                      ],
                      "ancestors": ["612e17f2443a71e64c66c7aa"],
                      "count": 3,
                      "slug": "mobile-phones",
                      "parentId": "612e17f2443a71e64c66c7aa",
                      "image": "default.png",
                    }
                  ],
                  "attributes": [
                    {
                      "slug": "ram",
                      "name": "ram",
                      "display": "number",
                      "categoryIds": ["612e17f2443a71e64c66c7bb"],
                      "isRequired": true,
                      "options": ["4", "6", "12", "16", "32"],
                      "currentData": [
                        {
                          "value": "4",
                          "count": 15,
                        },
                        {
                          "value": "8",
                          "count": 20,
                        },
                      ],
                      "subAttributes": [
                        {
                          "name": "ram type",
                          "options": ["ddr3", "ddr4"]
                        }
                      ]
                    },
                    {
                      "slug": "internal-hard-disk",
                      "name": "internal hard disk",
                      "display": "number",
                      "categoryIds": ["612e17f2443a71e64c66c7bb"],
                      "isRequired": true,
                      "options": [
                        "8",
                        "16",
                        "32",
                        "64",
                        "128",
                        "256",
                        "500"
                      ],
                      "currentData": [
                        {"value": "128", "count": 15},
                        {"value": "256", "count": 29},
                        {"value": "500", "count": 60},
                      ],
                      "modifiers": ["ssd sata", "hdd", "ssd nvme"],
                    },
                    {
                      "slug": "color",
                      "name": "color",
                      "display": "text",
                      "categoryIds": [
                        "612e17f2443a71e64c66c7cc",
                        "612e17f2443a71e64c66c7bb"
                      ],
                      "isRequired": false,
                      "options": ["red", "blue", "black"],
                      "currentData": [
                        {"value": "blue", "count": 15},
                        {"value": "black", "count": 25},
                      ]
                    },
                    {
                      "slug": "condition",
                      "name": "condition",
                      "display": "dropdown",
                      "categoryIds": [
                        "612e17f2443a71e64c66c7aa",
                        "612e17f2443a71e64c66c7bb",
                        "612e17f2443a71e64c66c7cc"
                      ],
                      "isRequired": true,
                      "options": [
                        "new",
                        "used",
                        "almost new",
                        "used abroad"
                      ],
                      "currentData": [
                        {"value": "new", "count": 20},
                        {"value": "used", "count": 25},
                      ]
                    },
                  ],
                  "ancestors": ["612e17f2443a71e64c66c7aa"],
                  "count": 3,
                  "slug": "mobile-phones",
                  "parentId": "612e17f2443a71e64c66c7aa",
                  "image": "default.png",
                },
                {
                  "name": "computers and laptops 2",
                  "id": "612e17f2443a71e64c66c7bbf",
                  "isCreatable": true,
                  "hasSubcategory": false,
                  "subCategories": [],
                  "attributes": [
                    {
                      "slug": "ram",
                      "name": "ram",
                      "display": "number",
                      "categoryIds": ["612e17f2443a71e64c66c7bb"],
                      "isRequired": true,
                      "options": ["4", "6", "12", "16", "32"],
                      "currentData": [
                        {
                          "value": "4",
                          "count": 15,
                        },
                        {
                          "value": "8",
                          "count": 20,
                        },
                      ],
                      "subAttributes": [
                        {
                          "name": "ram type",
                          "options": ["ddr3", "ddr4"]
                        }
                      ]
                    },
                    {
                      "slug": "internal-hard-disk",
                      "name": "internal hard disk",
                      "display": "number",
                      "categoryIds": ["612e17f2443a71e64c66c7bb"],
                      "isRequired": true,
                      "options": [
                        "8",
                        "16",
                        "32",
                        "64",
                        "128",
                        "256",
                        "500"
                      ],
                      "currentData": [
                        {"value": "128", "count": 15},
                        {"value": "256", "count": 29},
                        {"value": "500", "count": 60},
                      ],
                      "modifiers": ["ssd sata", "hdd", "ssd nvme"],
                    },
                    {
                      "slug": "color",
                      "name": "color",
                      "display": "text",
                      "categoryIds": [
                        "612e17f2443a71e64c66c7cc",
                        "612e17f2443a71e64c66c7bb"
                      ],
                      "isRequired": false,
                      "options": ["red", "blue", "black"],
                      "currentData": [
                        {"value": "blue", "count": 15},
                        {"value": "black", "count": 25},
                      ]
                    },
                    {
                      "slug": "condition",
                      "name": "condition",
                      "display": "dropdown",
                      "categoryIds": [
                        "612e17f2443a71e64c66c7aa",
                        "612e17f2443a71e64c66c7bb",
                        "612e17f2443a71e64c66c7cc"
                      ],
                      "isRequired": true,
                      "options": [
                        "new",
                        "used",
                        "almost new",
                        "used abroad"
                      ],
                      "currentData": [
                        {"value": "new", "count": 20},
                        {"value": "used", "count": 25},
                      ]
                    },
                  ],
                  "ancestors": ["612e17f2443a71e64c66c7aa"],
                  "count": 3,
                  "slug": "mobile-phones",
                  "parentId": "612e17f2443a71e64c66c7aa",
                  "image": "default.png",
                },
              ],
              "parentId": "",
              "image": "default.png",
              "description": "this is a description"
            },
          ],
        });
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
