import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ListReviews extends StatefulWidget {
  const ListReviews({Key? key}) : super(key: key);


  @override
  State<ListReviews> createState() => _ListReviewsState();
}

class _ListReviewsState extends State<ListReviews> {
  double userRating = 0;
  bool _isChecked = false;
  double _count=0;
  String url="https://play-lh.googleusercontent.com/I-Yd5tJnxw7Ks8FUhUiFr8I4kohd9phv5sRFHG_-nSX9AAD6Rcy570NBZVFJBKpepmc=w240-h480-rw";
  String url2="https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),// You can add title here
        leading: IconButton(

          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue.withOpacity(0.3), //You can make this transparent
        elevation: 0.0, //No shadow
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
// mainAxisSize: MainAxisSize.min,

          children:[
            //------------------- reviews count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text("8 Reviews "),

              Row(
                children: [
                  Checkbox(value: _isChecked, onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  }, ),
                  Text("with Photo "),
                ],
              ),

              ],
            ),


            Expanded(
              child: ListView(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  SingleReview( url2:""),
                  SingleReview(url2:""),
                  SingleReview(url2:""),
                  SingleReview(url2:""),
                  ]),
            ),


            // GridView.count(
            //     crossAxisCount: 1,
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     children: const [
            //       SingleReview( url2:""),
            //       SingleReview(url2:""),
            //       SingleReview(url2: "url2"),
            //     ]),


          //   SingleChildScrollView(
          //   child: Column(
          //     children: [
          //
          //       SizedBox(
          //         height: 10,
          //       ),
          //       //----------------------  A single Review -------------------
          //
          //     ],
          //   ),
          // ),
    ]
        ),
      ),
        floatingActionButton: SizedBox(
          height:40,
          width:200,
          child: FloatingActionButton(
            isExtended: true,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(100)
            ),

            onPressed: () => setState(() {
              _count++;
            }),
            tooltip: 'Increment Counter',
            child: ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.lightBlueAccent),

                elevation: MaterialStateProperty.all(6),
                backgroundColor:
                MaterialStateProperty.all(const Color(0xff40BFFF)),
                fixedSize: MaterialStateProperty.all(Size(Get.width, 54)),
              ),
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.add_sharp, color: Colors.white),
                  const Text(
                    'Write a Review',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            )
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }
}

class SingleReview extends StatelessWidget {
  const SingleReview({
    Key? key,
    required this.url2,
  }) : super(key: key);

  final String url2;
  final String url="https://play-lh.googleusercontent.com/I-Yd5tJnxw7Ks8FUhUiFr8I4kohd9phv5sRFHG_-nSX9AAD6Rcy570NBZVFJBKpepmc=w240-h480-rw";

  @override
  Widget build(BuildContext context) {
    return Stack(

    clipBehavior: Clip.hardEdge,
      children: [


        Positioned(

            // bottom:1,// left: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.25),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 33 ),
            child: Column(

              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text("Helen  Moore"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      // ignoreGestures: true,
                      // tapOnlyMode: true,
                      // initialRating: 3,
                      itemSize: 15,
                      minRating: 1,
                      direction: Axis.horizontal,
                      // allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {

                      },
                    ),

                    Text("june 5, 2019"),
                  ],
                ),
                Text("The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7 and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well. "),

                Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                  Text("heplpful"),
                  IconButton(
                    icon: Icon(Icons.thumb_up_outlined, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],)
              ],
            ),
          ),
        ),
        Positioned(
          left: 0, top: 0,
          child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 27,
              backgroundImage: NetworkImage("url"),
              child: ClipOval(child: Image(image: OptimizedCacheImageProvider(url)))
          ),
        ),
      ],
    );
  }
}
