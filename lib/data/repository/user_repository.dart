import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/src/models/models.dart';

class UserRepository {
  final GraphQLClient _gqlClient = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink("https://finalproject34.herokuapp.com/graphql"));

  Future<User> signupUser(variables) async {
    String signupMutation = r'''
     mutation SignUpUser($input: UserInput!) {
      createUser(input: $input) {
        firstName
        lastName
        phone
      }
    }
      ''';

    final response = await _gqlClient.query(
        QueryOptions(document: gql(signupMutation), variables: variables));
    print(response);
    return User.fromJson(response.data!['createUser']);
  }
}
