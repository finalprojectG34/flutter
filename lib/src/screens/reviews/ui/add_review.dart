import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/screens/reviews/review_ctx.dart';

import '../model.review.dart';

class AddReview extends StatefulWidget {
  const AddReview({Key? key}) : super(key: key);

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  double userRating = 0;
  String body = '';
  ReviewController reviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            'Review this product',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          RatingBar.builder(
            // ignoreGestures: true,
            // tapOnlyMode: true,
            // initialRating: 3,
            itemSize: 25,
            minRating: 1,
            direction: Axis.horizontal,
            // allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              userRating = rating;
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'You can write your opinion about the product',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            //-----------------------  Text Field -----------------------
            child: TextField(
              maxLines: 20,
              minLines: 5,
              onChanged: (input) => body = input,
              decoration: const InputDecoration(
                labelText: 'Your review (Optional)',
                labelStyle: TextStyle(
                  fontSize: 16,
                  // color: Colors.blue,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.75,
                    // color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.75,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),

          // -----------------       Review Button ---------------------
          ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.lightBlueAccent),
              elevation: MaterialStateProperty.all(6),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff40BFFF)),
              fixedSize: MaterialStateProperty.all(Size(Get.width, 54)),
            ),
            onPressed: () async {
              reviewController.createReview(
                Review(
                  rating: userRating,
                  body: body,
                  onModel: OnModel.ITEM,
                  modelId: "62a4d8c5eab9ffc41e17a380",
                ),
              );
              // reviewController.createReview({body, userRating});
            },
            child: const Text(
              'Review',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
