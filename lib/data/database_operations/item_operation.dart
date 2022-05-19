import 'package:graphql_flutter/graphql_flutter.dart';

import '../../src/app.dart';

class ItemOperation {
  final GraphQLClient _gqlClient = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink("https://finalproject34.herokuapp.com/graphql"));

  Future<List<Item>> getItems(query) async {
    final response = await _gqlClient.queryManager.fetchQuery(
      '1',
      QueryOptions(
        document: gql(query),
      ),
    );
    return (response.data!['getAllItems'] as List)
        .map((json) => Item.fromJson(json))
        .toList();
  }

  Future<List<Category>> getCategory(query) async {
    final response = await _gqlClient.queryManager.fetchQuery(
      '1',
      QueryOptions(
        document: gql(query),
      ),
    );
    return (response.data!['getAllCategories'] as List)
        .map((json) => Category.fromJson(json))
        .toList();
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
                  "parentId": "",
                  "image": "default.png",
                  "description": "this is a description"
                },
              ],
            });
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

    final response = await _gqlClient
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
