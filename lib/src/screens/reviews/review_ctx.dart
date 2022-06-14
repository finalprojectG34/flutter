import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import 'package:sms/src/utils/loger/console_loger.dart';

import './model.review.dart';
import './repository.review.dart';


class ReviewController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var reviewsList = Rx<List<Review>?>(null);
  Rx<Review> review = const Review().obs;

  final ReviewRepository reviewRepository;
  ReviewController({required this.reviewRepository});

  Future<List<Review>?> getReviews(int pageIndex, int pageSize) async {
    if (pageIndex < 1) {
      isLoading(true);
    }
    try {
      final reviews = await reviewRepository.getReviews();
      reviewsList(reviews);
      return reviews;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
    return null;
  }
  createReview( variables) async {
    logTrace("reviewVariable", variables);
    try {
      final reviews = await reviewRepository.CreateReview(variables);
      reviewsList(reviews);
      return reviews;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
    return null;
  }


}


