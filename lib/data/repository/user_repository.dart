import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

import '../../src/models/models.dart';

class UserRepository {
  final GraphQLClient gqlClient;

  UserRepository({required this.gqlClient});

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

    final response = await gqlClient
        .mutate(MutationOptions(
            document: gql(signupMutation), variables: variables))
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });

    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    } else {
      print(response);
    }

    return User.fromJson(response.data!['authPhoneAndRegister']['user'],
        token: response.data!['authPhoneAndRegister']['token']);
  }

  Future reset(variable) async {
    String signupMutation = r'''
     mutation AuthPhoneAndResetPwd($token: resetPwdInput) {
        authPhoneAndResetPwd(token: $token) {
          user {
            id
            firstName
            lastName
          }
          token
        }
    }
     ''';

    final response = await gqlClient.mutate(
        MutationOptions(document: gql(signupMutation), variables: variable));
    logTrace('data res', response);

    // if (response.hasException) {
    //   print(response.exception);
    //   throw Exception("Error Happened");
    // }
    // else {
    //   print(response);
    // }

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
      throw Exception("Error Happened");
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
            image {
              imageCover
           }
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
      MutationOptions(
        document: gql(signInMutation),
        variables: variables,
        fetchPolicy: FetchPolicy.noCache,
      ),
    )
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });

    if (response.hasException) {
      logTrace("response exception", response.exception);
      for (var element in response.exception!.graphqlErrors) {
        if (element.message == 'info or password wrong') {
          throw Exception("Username or Password Incorrect");
        }
        // if (response.exception!.graphqlErrors[0].message ==
        //     'info or password wrong') {
        throw Exception("Error Happened");
      }
      throw Exception("Error Happened");
    }

    if (response.data!['login']['user'] != null) {
      logTrace("new key",response);
      return User.fromJson(response.data!['login']['user'],
          token: response.data!['login']['token']);
    }
  }
}
