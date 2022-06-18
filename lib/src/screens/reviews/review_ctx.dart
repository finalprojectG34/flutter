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
  Rx<Review> review =  Review(modelId: "", ownerId: "", onModel: OnModel.ITEM,  body:"", rating: 4.5,).obs;

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
  createReview( Review variables) async {
    logTrace("reviewVariable", variables.body);
    try {
      final reviews = await reviewRepository.CreateReview(variables);
      reviewsList(reviews);
      return reviews;
    } catch (e) {
      logTrace("createRvwCtx", e.toString());
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
    return null;
  }


}


