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

  Future<Item> addItem(variable) async {
    String addItemMutation = r'''
     mutation CreateItem($input: ItemCreateInput!) {
  createItem(input: $input) {
    id
    name
    
  }
}
      ''';
    print(variable);
    final response = await _gqlClient
        .query(QueryOptions(document: gql(addItemMutation), variables: {
      "input": {
        "name": "item 5",
        "description": {"description": "desc", "lang": "en"},
        "image":
            "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg",
        "categoryId": "cat id 5"
      },
    }));
    print(response);
    return Item.fromJson(response.data!['createItem']);
  }
}
