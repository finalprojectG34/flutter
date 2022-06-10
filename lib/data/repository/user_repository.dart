import 'package:graphql_flutter/graphql_flutter.dart';

import '../../src/models/models.dart';

class UserRepository {
  final GraphQLClient gqlClient;

  UserRepository({required this.gqlClient});

  // SignUpController signUpController = Get.find();

  Future signupUser(variables) async {
    String signupMutation = r'''
     mutation AuthPhoneAndRegister($token: PhoneSignupInput) {
          authPhoneAndRegister(token: $token) {
            user {
              firstName
              lastName
              phone
              password
            }
            token
          }
        }
      ''';
    // print(variables.toString() + 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    final response = await gqlClient.mutate(
        MutationOptions(document: gql(signupMutation), variables: variables));
    print(
        '${response.data!['authPhoneAndRegister']['token']}   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

    return User.fromJson(response.data!['authPhoneAndRegister']['user'],
        token: response.data!['authPhoneAndRegister']['token']);
  }

  Future reset(String password, String token) async {
    String signupMutation = r'''
     mutation AuthPhoneAndRegister($token: PhoneSignupInput) {
          authPhoneAndRegister(token: $token) {
              token
          }
        }
      ''';
    // print(variables.toString() + 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    final response = await gqlClient
        .mutate(MutationOptions(document: gql(signupMutation), variables: {
      "token": {
        "password": password,
        "confirmPassword": password,
        "idToken": token
      }
    }));
    print(
        '${response.data!['authPhoneAndResetPwd']['token']}   zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');

    return User.fromJson(response.data!['authPhoneAndResetPwd']['user'],
        token: response.data!['authPhoneAndResetPwd']['token']);
  }

  Future signInUser(variables) async {
    String signInMutation = r'''
             mutation Login($input: loginInput!) {
                login(input: $input) {
                  user {
                    id
                    firstName
                    lastName
                    phone
                  }
                  token
                }
        }
      ''';
    final response = await gqlClient.mutate(
      MutationOptions(document: gql(signInMutation), variables: variables),
    );

    if(response.hasException){
      print(response.exception);
    }

    if (response.data!['login']['user'] != null) {
      return User.fromJson(response.data!['login']['user'],
          token: response.data!['login']['token']);
    }
  }
}
