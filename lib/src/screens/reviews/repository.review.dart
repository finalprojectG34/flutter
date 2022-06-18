import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

import './model.review.dart';
// import '../../src/models/models.dart';

class ReviewRepository {
  final GraphQLClient gqlClient;

  ReviewRepository({required this.gqlClient});

  // SignUpController signUpController = Get.find();

  Future CreateReview(Review variables) async {
    logTrace("variable==", variables.onModel);
    String createReviewMutation = r'''
    mutation CreateReview($input: ReviewInput!) {
      createReview(input: $input) {
        id
        modelId
        ownerId{firstName,id, poster}
        body
      }
    }
      ''';
    try {
      final response = await gqlClient.mutate(
          MutationOptions(document: gql(createReviewMutation), variables: {
        "input": {
          // "onModel":"ITEM",
          "modelId": variables.modelId,
          "body": variables.body,
          "rating": variables.rating
        },
      }));

      logTrace("review", response.data!['createReview']);
      return Review.fromJson(response.data!['createReview']);
    } catch (e) {
      logTrace("mutation Error", e.toString());
      rethrow;
    }
  }

  Future updateReview(String id, String body, double rating) async {
    String updateRvw = r'''
     mutation UpdateReview($updateReviewInput: ReviewInput!, $updateReviewId: String) {
        updateReview(input: $updateReviewInput, id: $updateReviewId) {
          id
          onModel
          modelId
          user
          body
          rating
        }
      }
      ''';
    // print(variables.toString() + 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    final response = await gqlClient
        .mutate(MutationOptions(document: gql(updateRvw), variables: {
      "updateReviewInput": {"body": body, "rating": rating},
      "updateReviewId": id
    }));

    logTrace("update Review", '${response.data!['updateReview']}');

    return Review.fromJson(response.data!['authPhoneAndResetPwd']['user']);
  }

  Future<List<Review>> getReviews() async {
    final response = await gqlClient
        .query(
      QueryOptions(
        document: gql(r'''
          query GetAllReviews {
            getAllReviews {
              id
              onModel
              modelId
              user
              body
              rating
            }
          }
        '''),
      ),
    )
        .timeout(const Duration(seconds: 30), onTimeout: () {
      throw TimeoutException('request timed out', const Duration(seconds: 30));
    });

    if (response.hasException) {
      logTrace("responseException", response.exception);
    }

    return (response.data!['getAllReviews'] as List)
        .map((json) => Review.fromJson(json))
        .toList();
  }
}
