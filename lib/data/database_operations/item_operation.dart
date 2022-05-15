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
}
