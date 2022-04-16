import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/utils/Constants.dart';

import '../../app.dart';
import '../../app.dart';
import '../../bloc/bloc.dart';
import '../../models/models.dart';

part 'home_components.dart';

class Home extends StatefulWidget {
  final bool hasSearchBar;

  const Home({Key key, this.hasSearchBar}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;
  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          return null;
        },
        child: ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            if (widget.hasSearchBar)
              Card(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search, color: Color(0xFF0D90EE)),
                      onPressed: () {
                        return null;
                      },
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                        // style: TextStyle(fontSize: 13),
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.star_border, color: Colors.green[200]),
                      onPressed: () {
                        print('second search Icon');
                      },
                    ),
                    IconButton(
                      // constraints: BoxConstraints.loose(Size(15,35)),
                      icon: Icon(Icons.filter_list, color: Colors.green[200]),
                      onPressed: () {
                        print('first search Icon');
                      },
                    ),
                  ],
                ),
              ),
            //Header
            // _header(context),
            //Banner
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              CarouselSlider(
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.black26),
                        child: Container(
                          // height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.9),
                                  BlendMode.dstATop),
                              image: NetworkImage(
                                  "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Super flash sale',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 26)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "50% off",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    // pageSnapping: false,
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ]),
            // _banner(context),
            SizedBox(
              height: 10.0,
            ),
            _popularCategories(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Flash Sale',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black)),
            ),
            GridView.count(
              childAspectRatio: .5,
              crossAxisCount: 2,
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              // child: Co,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.view_carousel_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'some text',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(12)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$600',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: InkWell(
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                              // padding: const EdgeInsets.only(r),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100),
                                // border: Border.all(color: Colors.grey),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              // child: Co,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.view_carousel_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'some text',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(12)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$600',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: InkWell(
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                              // padding: const EdgeInsets.only(r),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100),
                                // border: Border.all(color: Colors.grey),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 5,
              padding: EdgeInsets.all(7),
              mainAxisSpacing: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Visit shops',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)),
                  TextButton(onPressed: () {}, child: Text('See all'))
                ],
              ),
            ),
            GridView.count(
              childAspectRatio: 1.2,
              crossAxisCount: 2,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.white70,
                                color: Colors.grey.withOpacity(.5),
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(color: Colors.grey),
                              ),
                              // height: 250,
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //     fit: BoxFit.cover,
                              //     colorFilter: ColorFilter.mode(
                              //         Colors.black.withOpacity(0.9),
                              //         BlendMode.dstATop),
                              //     image: NetworkImage(
                              //         "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                              //   ),
                              // ),

                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Coveted clicks',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on_outlined,color: Colors.white,),
                                      Text('Addis Ababa')
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 8),
                                child: InkWell(
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.blue,
                                    ),
                                    // padding: const EdgeInsets.only(r),
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(100),
                                      // border: Border.all(color: Colors.grey),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            Container(
                              transform:
                                  Matrix4.translationValues(0.0, 25.0, 0.0),
                              padding: EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.woolha.com/media/2020/03/eevee.png'),
                                  radius: 25,
                                ),
                              ),
                            )

                            // Column(
                            //   // alignment: AlignmentDirectional.topStart,
                            //   children: [
                            //     Container(
                            //       color: Colors.grey,
                            //       // height: 250,
                            //       // decoration: BoxDecoration(
                            //       //   image: DecorationImage(
                            //       //     fit: BoxFit.cover,
                            //       //     colorFilter: ColorFilter.mode(
                            //       //         Colors.black.withOpacity(0.9),
                            //       //         BlendMode.dstATop),
                            //       //     image: NetworkImage(
                            //       //         "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                            //       //   ),
                            //       // ),
                            //
                            //       padding: EdgeInsets.symmetric(
                            //           vertical: 18, horizontal: 12),
                            //       // child: Co,
                            //     ),
                            //     Align(
                            //       alignment: Alignment.topRight,
                            //       child: Padding(
                            //         padding: const EdgeInsets.only(
                            //             right: 8.0, top: 8),
                            //         child: InkWell(
                            //           child: Container(
                            //             child: Icon(
                            //               Icons.add,
                            //               color: Colors.blue,
                            //             ),
                            //             // padding: const EdgeInsets.only(r),
                            //             decoration: BoxDecoration(
                            //               color: Colors.white70,
                            //               borderRadius:
                            //                   BorderRadius.circular(100),
                            //               // border: Border.all(color: Colors.grey),
                            //             ),
                            //           ),
                            //           borderRadius: BorderRadius.circular(50),
                            //           onTap: () {},
                            //         ),
                            //       ),
                            //     ),
                            //     CircleAvatar(
                            //       backgroundImage: NetworkImage(
                            //           'https://www.woolha.com/media/2020/03/eevee.png'),
                            //       radius: 25,
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone),
                            SizedBox(
                              width: 5,
                            ),
                            Text('+251900000000'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.white70,
                                color: Colors.grey.withOpacity(.5),
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(color: Colors.grey),
                              ),
                              // height: 250,
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //     fit: BoxFit.cover,
                              //     colorFilter: ColorFilter.mode(
                              //         Colors.black.withOpacity(0.9),
                              //         BlendMode.dstATop),
                              //     image: NetworkImage(
                              //         "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                              //   ),
                              // ),

                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Coveted clicks',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on_outlined,color: Colors.white,),
                                      Text('Addis Ababa')
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 8),
                                child: InkWell(
                                  child: Container(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.blue,
                                    ),
                                    // padding: const EdgeInsets.only(r),
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(100),
                                      // border: Border.all(color: Colors.grey),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            Container(
                              transform:
                                  Matrix4.translationValues(0.0, 25.0, 0.0),
                              padding: EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.woolha.com/media/2020/03/eevee.png'),
                                  radius: 25,
                                ),
                              ),
                            )

                            // Column(
                            //   // alignment: AlignmentDirectional.topStart,
                            //   children: [
                            //     Container(
                            //       color: Colors.grey,
                            //       // height: 250,
                            //       // decoration: BoxDecoration(
                            //       //   image: DecorationImage(
                            //       //     fit: BoxFit.cover,
                            //       //     colorFilter: ColorFilter.mode(
                            //       //         Colors.black.withOpacity(0.9),
                            //       //         BlendMode.dstATop),
                            //       //     image: NetworkImage(
                            //       //         "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                            //       //   ),
                            //       // ),
                            //
                            //       padding: EdgeInsets.symmetric(
                            //           vertical: 18, horizontal: 12),
                            //       // child: Co,
                            //     ),
                            //     Align(
                            //       alignment: Alignment.topRight,
                            //       child: Padding(
                            //         padding: const EdgeInsets.only(
                            //             right: 8.0, top: 8),
                            //         child: InkWell(
                            //           child: Container(
                            //             child: Icon(
                            //               Icons.add,
                            //               color: Colors.blue,
                            //             ),
                            //             // padding: const EdgeInsets.only(r),
                            //             decoration: BoxDecoration(
                            //               color: Colors.white70,
                            //               borderRadius:
                            //                   BorderRadius.circular(100),
                            //               // border: Border.all(color: Colors.grey),
                            //             ),
                            //           ),
                            //           borderRadius: BorderRadius.circular(50),
                            //           onTap: () {},
                            //         ),
                            //       ),
                            //     ),
                            //     CircleAvatar(
                            //       backgroundImage: NetworkImage(
                            //           'https://www.woolha.com/media/2020/03/eevee.png'),
                            //       radius: 25,
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone),
                            SizedBox(
                              width: 5,
                            ),
                            Text('+251900000000'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ],
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 5,
              padding: EdgeInsets.all(7),
              mainAxisSpacing: 5,
            ),
            // Text('New Products',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: Colors.black)),
            //
            // //====================== horizontal scroll
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 5),
            //     child: InfiniteItem(),
            //   ),
            // ),
            //
            // SizedBox(
            //   height: 10.0,
            // ),

            // Padding(
            //   child: Text(
            //     'Explore Popular Categories',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20,
            //         color: Colors.black),
            //   ),
            //   padding: EdgeInsets.all(8.0),
            // ),
            //Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Latest products',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)),
                  TextButton(onPressed: () {}, child: Text('See all'))
                ],
              ),
            ),
            GridView.count(
              childAspectRatio: .5,
              crossAxisCount: 2,
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              // child: Co,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.view_carousel_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'some text',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(12)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$600',
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: InkWell(
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                              // padding: const EdgeInsets.only(r),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100),
                                // border: Border.all(color: Colors.grey),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              // child: Co,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.view_carousel_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'some text',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(12)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$600',
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: InkWell(
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                              // padding: const EdgeInsets.only(r),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100),
                                // border: Border.all(color: Colors.grey),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              // child: Co,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.view_carousel_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'some text',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(12)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$600',
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: InkWell(
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                              // padding: const EdgeInsets.only(r),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100),
                                // border: Border.all(color: Colors.grey),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              // child: Co,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.view_carousel_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'some text',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(12)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$600',
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: InkWell(
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                              // padding: const EdgeInsets.only(r),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100),
                                // border: Border.all(color: Colors.grey),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              // child: Co,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.view_carousel_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'some text',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(12)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$600',
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: InkWell(
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                              // padding: const EdgeInsets.only(r),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100),
                                // border: Border.all(color: Colors.grey),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              // child: Co,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.view_carousel_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'some text',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(12)',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$600',
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.lineThrough,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '\$300',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                          child: InkWell(
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                              // padding: const EdgeInsets.only(r),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.2),
                                borderRadius: BorderRadius.circular(100),
                                // border: Border.all(color: Colors.grey),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 5,
              padding: EdgeInsets.all(7),
              mainAxisSpacing: 5,
            ),
          ],
        ));
  }

  Widget _header(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Color(0xFF0D90EE)),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      child: Stack(
        children: [
          Padding(
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25)),
                    Text(
                      'The best supermarket',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    )
                  ],
                ),
              ),
              padding: EdgeInsets.only(left: 6)),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: Colors.white),
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.search, color: Color(0xFF0D90EE)),
                    onPressed: () {
                      return null;
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 13),
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star_border, color: Colors.green[200]),
                    onPressed: () {
                      print('second search Icon');
                    },
                  ),
                  IconButton(
                    // constraints: BoxConstraints.loose(Size(15,35)),
                    icon: Icon(Icons.filter_list, color: Colors.green[200]),
                    onPressed: () {
                      print('first search Icon');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _banner(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9), BlendMode.dstATop),
          image: NetworkImage(
              "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NEW ERA OF SMARTPHONES',
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 22)),
          SizedBox(
            height: 10.0,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text(
                "\$400",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey),
              ),
              Text(
                "\$300",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.redAccent),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "iPhone 12 Pro Max",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          RaisedButton(
            child: Text('Shop Now'),
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
          ),
        ],
      ),
    );
  }

  Widget _popularCategories(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          crossAxisCount: 3,
          children: [
            _categoryItem(context, Constants.foodImagePath, "Food"),
            _categoryItem(context, Constants.candyImagePath, "Candies"),
            _categoryItem(context, Constants.watchImagePath, "Watches"),
            _categoryItem(context, Constants.sneakersImagePath, "Sneakers"),
            _categoryItem(context, Constants.cosmeticsImagePath, "Beauty"),
            _categoryItem(context, Constants.sampleImagePath, "Smartphones"),
          ],
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 5,
          padding: EdgeInsets.all(7),
          mainAxisSpacing: 5,
        ),
        TextButton(onPressed: () {}, child: Text('More category'))
      ],
    );
  }

  Widget _categoryItem(BuildContext context, String imagePath, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          // backgroundColor: Color(0x0CAE5FF),
          backgroundColor: Color(0xffffe4ca),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),

          radius: 40,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

Widget itemView(BuildContext ctx, Item item) => Container(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      width: 150,
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => {},
          child: Column(
            children: [
              Image.network(Constants.watchImagePath),
              Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Text(item.name),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: [
                    Text(
                      '\$ ${item.price}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
