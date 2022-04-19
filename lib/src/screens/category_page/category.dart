// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// // import 'package:shopping/src/models/item.dart';
// import 'package:sms/src/models/item.dart';
// import 'package:sms/src/screens/home_page/item_detail/item_detail.dart';
//
// import '../../app.dart';
//
//
//
// part 'category_components.dart';
//
// // class CategoriesPage extends StatelessWidget {
// //   static const String pathName = '/categories';
// //
// //   const CategoriesPage({
// //     Key key,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView(
// //       children: <Widget>[
// //         categoryTitle,
// //         categoryButton,
// //
// //         //================ categories container
// //         Container(
// //           height: MediaQuery.of(context).size.height * 0.26,
// //           padding: EdgeInsets.symmetric(horizontal: 10),
// //           child: GridView.builder(
// //             physics: NeverScrollableScrollPhysics(),
// //             // Create a grid with 2 columns. If you change the scrollDirection to
// //             // horizontal, this produces 2 rows.
// //             itemCount: 8,
// //             gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
// //                 crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8),
// //             itemBuilder: (BuildContext context, int index) {
// //               return SingleCategoryItem();
// //             },
// //           ),
// //         ),
// //         //----just name
// //         allCategory,
// //
// //         //========================= Horizontal items
// //         Container(
// //           height: MediaQuery.of(context).size.height * 0.41,
// //           child: Padding(
// //             padding: const EdgeInsets.only(right: 5),
// //             child: InfiniteItem(),
// //
// //             // child: ListView.builder(
// //             //   itemCount: 6,
// //             //   itemBuilder: (context, index) => ItemCard(
// //             //     width: 150,
// //             //   ),
// //             //   scrollDirection: Axis.horizontal,
// //             // ),
// //           ),
// //         ),
// //         //==============================        main item  Grid
// //         Container(
// //             padding: EdgeInsets.symmetric(horizontal: 3),
// //             margin: EdgeInsets.only(top: 10),
// //             child: MainGridBox())
// //       ],
// //     );
// //   }
// // }
// class CategoriesPage extends StatefulWidget {
//   static const String pathName = '/categories';
//   const CategoriesPage({Key? key}) : super(key: key);
//
//   @override
//   State<CategoriesPage> createState() => _CategoriesPageState();
// }
//
// class _CategoriesPageState extends State<CategoriesPage> {
//   int _current = 0;
//   CarouselController _controller = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         categoryTitle,
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: SingleChildScrollView(scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   InkWell(
//                     child: Container(
//                       child: Icon(Icons.app_settings_alt,color: Colors.blue,),
//                       padding: const EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         border: Border.all(color: Colors.grey.withOpacity(.3)),
//                       ),
//                     ),
//                     borderRadius: BorderRadius.circular(50),
//                     onTap: () {
//                       // addCategoryController.addEditCategoryModel(categoryId);
//                       // Get.back();
//                     },
//                   ),
//                   SizedBox(height: 5,),
//                   Text(
//                     'Cat name',
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 14,
//                     ),
//                   )
//                 ],
//               ),SizedBox(width: 20,),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     InkWell(
//                       child: Container(
//                         child: Icon(Icons.app_settings_alt,color: Colors.blue,),
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(color: Colors.grey.withOpacity(.3)),
//                         ),
//                       ),
//                       borderRadius: BorderRadius.circular(50),
//                       onTap: () {
//                         // addCategoryController.addEditCategoryModel(categoryId);
//                         // Get.back();
//                       },
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                       'Cat name',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     )
//                   ],
//                 ),SizedBox(width: 20,),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     InkWell(
//                       child: Container(
//                         child: Icon(Icons.app_settings_alt,color: Colors.blue,),
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(color: Colors.grey.withOpacity(.3)),
//                         ),
//                       ),
//                       borderRadius: BorderRadius.circular(50),
//                       onTap: () {
//                         // addCategoryController.addEditCategoryModel(categoryId);
//                         // Get.back();
//                       },
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                       'Cat name',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     )
//                   ],
//                 ),SizedBox(width: 20,),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     InkWell(
//                       child: Container(
//                         child: Icon(Icons.app_settings_alt,color: Colors.blue,),
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(color: Colors.grey.withOpacity(.3)),
//                         ),
//                       ),
//                       borderRadius: BorderRadius.circular(50),
//                       onTap: () {
//                         // addCategoryController.addEditCategoryModel(categoryId);
//                         // Get.back();
//                       },
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                       'Cat name',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     )
//                   ],
//                 ),SizedBox(width: 20,),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     InkWell(
//                       child: Container(
//                         child: Icon(Icons.app_settings_alt,color: Colors.blue,),
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(color: Colors.grey.withOpacity(.3)),
//                         ),
//                       ),
//                       borderRadius: BorderRadius.circular(50),
//                       onTap: () {
//                         // addCategoryController.addEditCategoryModel(categoryId);
//                         // Get.back();
//                       },
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                       'Cat name',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     )
//                   ],
//                 ),SizedBox(width: 20,),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     InkWell(
//                       child: Container(
//                         child: Icon(Icons.app_settings_alt,color: Colors.blue,),
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(color: Colors.grey.withOpacity(.3)),
//                         ),
//                       ),
//                       borderRadius: BorderRadius.circular(50),
//                       onTap: () {
//                         // addCategoryController.addEditCategoryModel(categoryId);
//                         // Get.back();
//                       },
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                       'Cat name',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     )
//                   ],
//                 ),SizedBox(width: 20,),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     InkWell(
//                       child: Container(
//                         child: Icon(Icons.app_settings_alt,color: Colors.blue,),
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(color: Colors.grey.withOpacity(.3)),
//                         ),
//                       ),
//                       borderRadius: BorderRadius.circular(50),
//                       onTap: () {
//                         // addCategoryController.addEditCategoryModel(categoryId);
//                         // Get.back();
//                       },
//                     ),
//                     SizedBox(height: 5,),
//                     Text(
//                       'Cat name',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     )
//                   ],
//                 ),
//
//           ],),),
//         ),
//         SizedBox(height: 5,),
//         Stack(alignment: AlignmentDirectional.bottomCenter, children: [
//           CarouselSlider(
//             items: [1, 2, 3, 4, 5].map((i) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: EdgeInsets.symmetric(horizontal: 5.0),
//                     decoration: BoxDecoration(color: Colors.black26),
//                     child: Container(
//                       // height: 250,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           colorFilter: ColorFilter.mode(
//                               Colors.black.withOpacity(0.9),
//                               BlendMode.dstATop),
//                           image: NetworkImage(
//                               "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
//                         ),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           vertical: 18, horizontal: 12),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Super flash sale',
//                               maxLines: 1,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   fontSize: 26)),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             "50% off",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 26,
//                                 color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//             carouselController: _controller,
//             options: CarouselOptions(
//               // pageSnapping: false,
//                 autoPlay: true,
//                 // enlargeCenterPage: true,
//                 viewportFraction: 1,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _current = index;
//                   });
//                 }),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(entry.key),
//                 child: Container(
//                   width: 8.0,
//                   height: 8.0,
//                   margin:
//                   EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: (Theme.of(context).brightness ==
//                           Brightness.dark
//                           ? Colors.white
//                           : Colors.black)
//                           .withOpacity(_current == entry.key ? 0.9 : 0.4)),
//                 ),
//               );
//             }).toList(),
//           ),
//         ]),
//         SizedBox(height: 10,),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Flash Sale',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.black)),TextButton(onPressed: (){}, child: Text('See more'))
//             ],
//           ),
//         ),
//         GridView.count(
//           childAspectRatio: .5,
//           crossAxisCount: 2,
//           children: [
//             Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       alignment: AlignmentDirectional.centerEnd,
//                       children: [
//                         Container(
//                           // height: 250,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               colorFilter: ColorFilter.mode(
//                                   Colors.black.withOpacity(0.9),
//                                   BlendMode.dstATop),
//                               image: NetworkImage(
//                                   "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
//                             ),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 18, horizontal: 12),
//                           // child: Co,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.favorite_border_rounded,
//                                   color: Colors.white,
//                                 )),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.view_carousel_outlined,
//                                   color: Colors.white,
//                                 )),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'some text',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             Text(
//                               'Item name',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '(12)',
//                                   style: TextStyle(color: Colors.grey),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   '\$600',
//                                   style: TextStyle(
//                                       decoration:
//                                       TextDecoration.lineThrough,
//                                       color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   '\$300',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8.0, bottom: 8),
//                       child: InkWell(
//                         child: Container(
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.blue,
//                           ),
//                           // padding: const EdgeInsets.only(r),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.withOpacity(.2),
//                             borderRadius: BorderRadius.circular(100),
//                             // border: Border.all(color: Colors.grey),
//                           ),
//                         ),
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: () {},
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       alignment: AlignmentDirectional.centerEnd,
//                       children: [
//                         Container(
//                           // height: 250,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               colorFilter: ColorFilter.mode(
//                                   Colors.black.withOpacity(0.9),
//                                   BlendMode.dstATop),
//                               image: NetworkImage(
//                                   "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
//                             ),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 18, horizontal: 12),
//                           // child: Co,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.favorite_border_rounded,
//                                   color: Colors.white,
//                                 )),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.view_carousel_outlined,
//                                   color: Colors.white,
//                                 )),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'some text',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             Text(
//                               'Item name',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '(12)',
//                                   style: TextStyle(color: Colors.grey),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   '\$600',
//                                   style: TextStyle(
//                                       decoration:
//                                       TextDecoration.lineThrough,
//                                       color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   '\$300',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8.0, bottom: 8),
//                       child: InkWell(
//                         child: Container(
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.blue,
//                           ),
//                           // padding: const EdgeInsets.only(r),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.withOpacity(.2),
//                             borderRadius: BorderRadius.circular(100),
//                             // border: Border.all(color: Colors.grey),
//                           ),
//                         ),
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: () {},
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           crossAxisSpacing: 5,
//           padding: EdgeInsets.all(7),
//           mainAxisSpacing: 5,
//         ),
//         categoryButton,
//
//         //================ categories container
//         Container(
//           height: MediaQuery.of(context).size.height * 0.26,
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: GridView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             // Create a grid with 2 columns. If you change the scrollDirection to
//             // horizontal, this produces 2 rows.
//             itemCount: 8,
//             gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8),
//             itemBuilder: (BuildContext context, int index) {
//               return SingleCategoryItem();
//             },
//           ),
//         ),
//         //----just name
//         allCategory,
//         GridView.count(
//           childAspectRatio: .5,
//           crossAxisCount: 2,
//           children: [
//             Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       alignment: AlignmentDirectional.centerEnd,
//                       children: [
//                         Container(
//                           // height: 250,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               colorFilter: ColorFilter.mode(
//                                   Colors.black.withOpacity(0.9),
//                                   BlendMode.dstATop),
//                               image: NetworkImage(
//                                   "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
//                             ),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 18, horizontal: 12),
//                           // child: Co,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.favorite_border_rounded,
//                                   color: Colors.white,
//                                 )),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.view_carousel_outlined,
//                                   color: Colors.white,
//                                 )),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'some text',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             Text(
//                               'Item name',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '(12)',
//                                   style: TextStyle(color: Colors.grey),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   '\$600',
//                                   style: TextStyle(
//                                       decoration:
//                                       TextDecoration.lineThrough,
//                                       color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   '\$300',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8.0, bottom: 8),
//                       child: InkWell(
//                         child: Container(
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.blue,
//                           ),
//                           // padding: const EdgeInsets.only(r),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.withOpacity(.2),
//                             borderRadius: BorderRadius.circular(100),
//                             // border: Border.all(color: Colors.grey),
//                           ),
//                         ),
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: () {},
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       alignment: AlignmentDirectional.centerEnd,
//                       children: [
//                         Container(
//                           // height: 250,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               colorFilter: ColorFilter.mode(
//                                   Colors.black.withOpacity(0.9),
//                                   BlendMode.dstATop),
//                               image: NetworkImage(
//                                   "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
//                             ),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 18, horizontal: 12),
//                           // child: Co,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.favorite_border_rounded,
//                                   color: Colors.white,
//                                 )),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.view_carousel_outlined,
//                                   color: Colors.white,
//                                 )),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'some text',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             Text(
//                               'Item name',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '(12)',
//                                   style: TextStyle(color: Colors.grey),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   '\$600',
//                                   style: TextStyle(
//                                       decoration:
//                                       TextDecoration.lineThrough,
//                                       color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   '\$300',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8.0, bottom: 8),
//                       child: InkWell(
//                         child: Container(
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.blue,
//                           ),
//                           // padding: const EdgeInsets.only(r),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.withOpacity(.2),
//                             borderRadius: BorderRadius.circular(100),
//                             // border: Border.all(color: Colors.grey),
//                           ),
//                         ),
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: () {},
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       alignment: AlignmentDirectional.centerEnd,
//                       children: [
//                         Container(
//                           // height: 250,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               colorFilter: ColorFilter.mode(
//                                   Colors.black.withOpacity(0.9),
//                                   BlendMode.dstATop),
//                               image: NetworkImage(
//                                   "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
//                             ),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 18, horizontal: 12),
//                           // child: Co,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.favorite_border_rounded,
//                                   color: Colors.white,
//                                 )),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.view_carousel_outlined,
//                                   color: Colors.white,
//                                 )),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'some text',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             Text(
//                               'Item name',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '(12)',
//                                   style: TextStyle(color: Colors.grey),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   '\$600',
//                                   style: TextStyle(
//                                       decoration:
//                                       TextDecoration.lineThrough,
//                                       color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   '\$300',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8.0, bottom: 8),
//                       child: InkWell(
//                         child: Container(
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.blue,
//                           ),
//                           // padding: const EdgeInsets.only(r),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.withOpacity(.2),
//                             borderRadius: BorderRadius.circular(100),
//                             // border: Border.all(color: Colors.grey),
//                           ),
//                         ),
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: () {},
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       alignment: AlignmentDirectional.centerEnd,
//                       children: [
//                         Container(
//                           // height: 250,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               colorFilter: ColorFilter.mode(
//                                   Colors.black.withOpacity(0.9),
//                                   BlendMode.dstATop),
//                               image: NetworkImage(
//                                   "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
//                             ),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 18, horizontal: 12),
//                           // child: Co,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.favorite_border_rounded,
//                                   color: Colors.white,
//                                 )),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.view_carousel_outlined,
//                                   color: Colors.white,
//                                 )),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'some text',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             Text(
//                               'Item name',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Colors.amber,
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '(12)',
//                                   style: TextStyle(color: Colors.grey),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   '\$600',
//                                   style: TextStyle(
//                                       decoration:
//                                       TextDecoration.lineThrough,
//                                       color: Colors.grey),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   '\$300',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8.0, bottom: 8),
//                       child: InkWell(
//                         child: Container(
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.blue,
//                           ),
//                           // padding: const EdgeInsets.only(r),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.withOpacity(.2),
//                             borderRadius: BorderRadius.circular(100),
//                             // border: Border.all(color: Colors.grey),
//                           ),
//                         ),
//                         borderRadius: BorderRadius.circular(50),
//                         onTap: () {},
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//
//           ],
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           crossAxisSpacing: 5,
//           padding: EdgeInsets.all(7),
//           mainAxisSpacing: 5,
//         ),
//         //========================= Horizontal items
//         // Container(
//         //   height: MediaQuery.of(context).size.height * 0.41,
//         //   child: Padding(
//         //     padding: const EdgeInsets.only(right: 5),
//         //     child: InfiniteItem(),
//         //
//         //     // child: ListView.builder(
//         //     //   itemCount: 6,
//         //     //   itemBuilder: (context, index) => ItemCard(
//         //     //     width: 150,
//         //     //   ),
//         //     //   scrollDirection: Axis.horizontal,
//         //     // ),
//         //   ),
//         // ),
//         // //==============================        main item  Grid
//         // Container(
//         //     padding: EdgeInsets.symmetric(horizontal: 3),
//         //     margin: EdgeInsets.only(top: 10),
//         //     child: MainGridBox())
//       ],
//     );
//   }
// }
//
// class MainGridBox extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _MainGridBoxState();
// }
//
// class _MainGridBoxState extends State<MainGridBox> {
//   ScrollController scrollController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     super.initState();
//     scrollController = ScrollController();
//     scrollController.addListener(_onScroll);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ItemBloc, ItemState>(
//       builder: (ctx, state) {
//         if (state is ItemsLoadSuccess) {
//           if (state.items.isEmpty) {
//             return Center(child: Text("No Product"));
//           }
//           return GridView.builder(
//             // Create a grid with 2 columns. If you change the scrollDirection to
//             // horizontal, this produces 2 rows.
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               controller: scrollController,
//               itemCount: state.hasReachedMax
//                   ? state.items.length
//                   : state.items.length + 1,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.63,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 if (index >= state.items.length) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   return ItemCard(
//                     item: state.items[index],
//                     width: 150,
//                   );
//                 }
//               });
//         }
//         if (state is ItemLoading) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return Center(
//           child: Column(
//             children: [
//               Text("Failed to load"),
//               OutlinedButton(
//                 onPressed: () {
//                   context.read<ItemBloc>().add(ItemLoad());
//                 },
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _onScroll() {
//     final maxScroll = scrollController.position.maxScrollExtent;
//     final currentScroll = scrollController.position.pixels;
//     if (maxScroll - currentScroll <= 200.0) {
//       BlocProvider.of<ItemBloc>(context).add(ItemLoad());
//     }
//   }
// }
//
// class SingleCategoryItem extends StatelessWidget {
//   const SingleCategoryItem({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image: DecorationImage(
//             colorFilter: ColorFilter.mode(Colors.grey[200], BlendMode.darken),
//             fit: BoxFit.cover,
//             image: AssetImage(
//               "images/StateBags.jpg",
//             )),
//       ),
//       width: MediaQuery.of(context).size.width / 3,
//       height: 50,
//     );
//   }
// }
