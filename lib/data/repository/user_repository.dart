import 'dart:async';

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
              id
              firstName
              lastName
              phone
              role
            }
            token
          }
        }
      ''';
    // print(variables.toString() + 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    final response = await gqlClient
        .mutate(MutationOptions(
            document: gql(signupMutation), variables: variables))
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });
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

  Future<Address> updateUserAddress(Address address) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
        mutation Mutation($input: UserAddressUpdateInput!) {
          updateUserAddress(input: $input) {
            id
            address {
              subCity
              city
              addressName
              country
            }
          }
        }
        '''),
      variables: {
        "input": {
          "subCity": address.subCity,
          "city": address.city,
          "addressName": address.addressName,
          "country": address.country,
        }
      },
    ));

    if (response.hasException) {
      print(response.exception);
      // throw response.exception;
    } else {
      print(response);
    }

    return Address.fromJson(response.data!['updateUserAddress']['address']);
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
              shopId
              role
              address {
                addressName
                city
                country
                subCity
              }
            }
            token
          }
      }
      ''';
    final response = await gqlClient
        .mutate(
      MutationOptions(document: gql(signInMutation), variables: variables),
    )
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });

    if (response.hasException) {
      for (var element in response.exception!.graphqlErrors) {
        if (element.message == 'info or password wrong') {
          return null;
        }
        // if (response.exception!.graphqlErrors[0].message ==
        //     'info or password wrong') {
        return null;
      }
    }

    if (response.data!['login']['user'] != null) {
      return User.fromJson(response.data!['login']['user'],
          token: response.data!['login']['token']);
    }
  }
}
