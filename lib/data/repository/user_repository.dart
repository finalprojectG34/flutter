import 'package:graphql_flutter/graphql_flutter.dart';

import '../../src/models/models.dart';

class UserRepository {
  final GraphQLClient _gqlClient = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink("http://192.168.0.172:8000/graphql"));

  // link: HttpLink("https://finalproject34.herokuapp.com/graphql"));

  Future signupUser(variables) async {
    String signupMutation = r'''
     mutation AuthPhoneAndRegister($token: PhoneSignupInput) {
          authPhoneAndRegister(token: $token) {
            user {
              firstName
              lastName
              phone
              password
              lastName
            }
            token
          }
        }
      ''';
    print(variables.toString() + 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    final response = await _gqlClient.mutate(
        MutationOptions(document: gql(signupMutation), variables: variables));

    print(
        '${User.fromJson(response.data!['authPhoneAndRegister']['user'])}  iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
    return User.fromJson(response.data!['authPhoneAndRegister']['user']);
  }
}
