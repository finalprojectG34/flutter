import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'list_reviews.dart';

class ReviewMiniDetail extends StatelessWidget {
  final int star;
  final int reviewCount;

  const ReviewMiniDetail(
      {Key? key, required this.reviewCount, required this.star})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Review',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: star.toDouble(),
                    // tapOnlyMode: true,
                    // initialRating: 3,
                    itemSize: 15,
                    minRating: 1,
                    direction: Axis.horizontal,
                    // allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {},
                    // onRatingUpdate: (rating) {
                    //   userRating = rating;
                    // },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('$reviewCount comments')
                ],
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    Get.to(() => ListReviews());
                  },
                  icon: Icon(Icons.arrow_forward_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
