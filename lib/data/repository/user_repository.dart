import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/src/models/models.dart';

class UserRepository {
  final GraphQLClient _gqlClient = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink("https://192.168.0.23:8000/graphql"));
      // link: HttpLink("https://finalproject34.herokuapp.com/graphql"));

  Future<void> signupUser(variables) async {
    String signupMutation = r'''
     mutation AuthPhoneAndRegister($token: PhoneSignupInput) {
  authPhoneAndRegister(token: $token) {
    user {
      firstName
      phone
      password
      lastName
    }
    token
  }
}
      ''';

    final response = await _gqlClient.query(
        QueryOptions(document: gql(signupMutation), variables: variables));
    print(response);
    // return User.fromJson(response.data!['authPhoneAndRegister']);
  }
}
