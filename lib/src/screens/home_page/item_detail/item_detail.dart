import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/screens/home_page/AppCtx.dart';

// import '../../components/shop_detail_component.dart';
import '../../../models/item.dart';
import '../../items/item_mini_view/item_history.dart';
import '../../reviews/ui/review_mini_detail.dart';

class ItemDetails extends StatefulWidget {
  static const routeName = '/itemDetail';
  final Item item;

  ItemDetails({required this.item});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetails> {
  int _notificationCounter = 1;
  int _shopCounter = 2;
  bool _notTouched = true;
  bool _onHeartClick = true;
  List<int> selected = [];

  void _touched() {
    setState(() {
      _notTouched = !_notTouched;
      _onHeartClick = !_onHeartClick;
    });
  }

  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.item.name}'),
      ),
      body: ListView(
        // shrinkWrap: true,
        children: [
          // const SuggestedItems(),
          SizedBox(
              height: 200,
              child: Image.network(
                widget.item.imagePath!,
                fit: BoxFit.fitWidth,
              )),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ETB ${widget.item.discountPrice != null ? widget.item.discountPrice : widget.item.price.toString()}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                // IconButton(
                //   splashColor: Colors.white,
                //   highlightColor: Colors.white,
                //   alignment: Alignment.centerRight,
                //   padding: EdgeInsets.zero,
                //   icon: Icon(
                //     _notTouched ? Icons.favorite_border : Icons.favorite,
                //     color: Colors.red,
                //     size: 20.0,
                //   ),
                //   onPressed: _touched,
                // )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.item.name!),
          ),
          SizedBox(
            height: 15.0,
          ),
          // IntrinsicHeight(
          //   child: Row(
          //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Icon(
          //         Icons.star,
          //         color: Colors.yellow,
          //       ),
          //       Text(
          //         "5.0 ",
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //       Text(
          //         "(11)",
          //         style: TextStyle(color: Colors.grey),
          //       ),
          //       VerticalDivider(
          //         thickness: 0.7,
          //         color: Colors.grey,
          //         width: 35.0,
          //       ),
          //       Text(
          //         "17 ",
          //         style: TextStyle(color: Colors.grey),
          //       ),
          //       Text(
          //         "Sale",
          //         style: TextStyle(color: Colors.grey),
          //       ),
          //       VerticalDivider(
          //         thickness: 0.7,
          //         color: Colors.grey,
          //         width: 35.0,
          //       ),
          //       Icon(
          //         Icons.location_on,
          //         color: Colors.grey,
          //       ),
          //       Text(
          //         "Addis Ababa",
          //         style: TextStyle(color: Colors.grey),
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 30.0,
          // ),
          // Text(
          //   "Variant",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          // ),
          // SizedBox(
          //   height: 10.0,
          // ),
          // Row(
          //   children: [
          //     Text("Size :"),
          //     SizedBox(
          //       width: 5.0,
          //     ),
          //     Text(
          //       "XS",
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 8.0),
          // Container(
          //   height: 38.0,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       shrinkWrap: true,
          //       itemCount: size.length,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           margin: EdgeInsets.only(right: 10.0),
          //           padding: EdgeInsets.all(10.0),
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //                 color: index == 0 ? Colors.blue : Colors.grey
          //                 // color: selected.map((e) => )
          //
          //                 ),
          //             borderRadius: BorderRadius.circular(10.0),
          //             color: index == 0 ? Colors.blue : Colors.white,
          //           ),
          //           child: Center(
          //             child: Text(
          //               "${size[index]}",
          //               style: TextStyle(
          //                   color: index == 0 ? Colors.white : Colors.black),
          //             ),
          //           ),
          //         );
          //       }),
          // ),
          // SizedBox(
          //   height: 20.0,
          // ),
          // Row(
          //   children: [
          //     Text("Color :"),
          //     SizedBox(
          //       width: 5.0,
          //     ),
          //     Text(
          //       "Red",
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 8.0,
          // ),
          // Container(
          //   height: 38.0,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       shrinkWrap: true,
          //       itemCount: colors.length,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           margin: EdgeInsets.only(right: 10.0),
          //           padding: EdgeInsets.all(10.0),
          //           // width: 25.0,
          //           // height: 25.0,
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //                 color: index == 0 ? Colors.blue : Colors.grey),
          //             borderRadius: BorderRadius.circular(10.0),
          //             color: index == 0 ? Colors.blue : Colors.white,
          //           ),
          //           child: Text(
          //             "${colors[index]}",
          //             style: TextStyle(
          //                 color: index == 0 ? Colors.white : Colors.black),
          //           ),
          //         );
          //       }),
          // ),
          // SizedBox(
          //   height: 20.0,
          // ),
          // Text(
          //   "Delivery",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          // ),
          // SizedBox(
          //   height: 15.0,
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //         child: Text(
          //             "Calculate the estimated cost for shipping goods to Addis Ababa, Ethiopia")),
          //     IconButton(
          //       icon: Icon(Icons.chevron_right),
          //       onPressed: () {},
          //       iconSize: 30.0,
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: 20.0,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Text(
          //     "Information",
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          //   ),
          // ),
          // SizedBox(
          //   height: 10.0,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: RowElement(
          //     description: "Weight",
          //     descriptionColor: Colors.grey,
          //     // isButton: false,
          //     status: "300 Gram",
          //     statusColor: Colors.grey,
          //   ),
          // ),
          // SizedBox(
          //   height: 10.0,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   child: Card(
          //     color: Colors.blue.shade200,
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          //       child: Column(
          //         children: [
          //           // Row(
          //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           //   children: [
          //           //     Text(
          //           //       'Total',
          //           //       style: TextStyle(
          //           //           color: Colors.white,
          //           //           fontWeight: FontWeight.bold,
          //           //           fontSize: 16),
          //           //     ),
          //           //     Text(
          //           //       'ETB 300',
          //           //       style: TextStyle(
          //           //           color: Colors.white,
          //           //           fontWeight: FontWeight.bold,
          //           //           fontSize: 16),
          //           //     )
          //           //   ],
          //           // ),
          //           // Padding(
          //           //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //           //   child: Row(
          //           //     mainAxisAlignment: MainAxisAlignment.center,
          //           //     children: [
          //           //       Text(
          //           //         "Information",
          //           //         style: TextStyle(
          //           //             fontWeight: FontWeight.bold,
          //           //             fontSize: 22.0,
          //           //             color: Colors.white),
          //           //       ),
          //           //       SizedBox(
          //           //         width: 20,
          //           //       ),
          //           //       Icon(
          //           //         Icons.info_outline,
          //           //         color: Colors.white,
          //           //       )
          //           //     ],
          //           //   ),
          //           // ),
          //           // Padding(
          //           //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //           //   child: Divider(
          //           //     color: Colors.white,
          //           //   ),
          //           // ),
          //           // Row(
          //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           //   children: [
          //           //     Text(
          //           //       'Condition',
          //           //       style: TextStyle(
          //           //           color: Colors.white,
          //           //           fontSize: 16,
          //           //           fontWeight: FontWeight.bold),
          //           //     ),
          //           //     Text(
          //           //       'new',
          //           //       style: TextStyle(
          //           //         color: Colors.white,
          //           //         fontSize: 16,
          //           //       ),
          //           //     )
          //           //   ],
          //           // ),
          //           // SizedBox(
          //           //   height: 5,
          //           // ),
          //           // Row(
          //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           //   children: [
          //           //     Text(
          //           //       'RAM',
          //           //       style: TextStyle(color: Colors.white),
          //           //     ),
          //           //     Text(
          //           //       '2 GB',
          //           //       style: TextStyle(color: Colors.white),
          //           //     )
          //           //   ],
          //           // ),
          //           // SizedBox(
          //           //   height: 5,
          //           // ),
          //           // Row(
          //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           //   children: [
          //           //     Text(
          //           //       'Internal HDD',
          //           //       style: TextStyle(color: Colors.white),
          //           //     ),
          //           //     Text(
          //           //       '300 GB',
          //           //       style: TextStyle(color: Colors.white),
          //           //     )
          //           //   ],
          //           // )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: RowElement(
          //     description: "Condition",
          //     descriptionColor: Colors.grey,
          //     // isButton: false,
          //     status: widget.item['attrs'][0]['val'],
          //     statusColor: Colors.grey,
          //   ),
          // ),
          // SizedBox(
          //   height: 10.0,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: RowElement(
          //     description: "Category",
          //     descriptionColor: Colors.grey,
          //     // isButton: false,
          //     status: "Electronic",
          //     statusColor: Colors.blue,
          //   ),
          // ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              color: Colors.black38,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('${widget.item.description}',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  // backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.woolha.com/media/2020/03/eevee.png'),
                    radius: 25,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop larson electronic',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Official store',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
          ReviewMiniDetail(
            reviewCount: 3,
            star: 3,
          ),
          // SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    // style: ButtonStyle(
                    //   shadowColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                    //   elevation: MaterialStateProperty.all(5),
                    //   backgroundColor:
                    //       MaterialStateProperty.all(const Color(0xff40BFFF)),
                    //   // fixedSize: MaterialStateProperty.all(Size(Get.width, 54)),
                    // ),
                    onPressed: () {
                      AppController appController = Get.find();
                      appController.getItemHistory(widget.item.id!);
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        context: context,
                        builder: (context) => ItemHistoryPage(),
                      );
                    },
                    child: const Text(
                      "View item history",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        // fontSize: 13
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: OutlinedButton(
                    // style: ButtonStyle(
                    //   shadowColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                    //   elevation: MaterialStateProperty.all(5),
                    //   backgroundColor:
                    //       MaterialStateProperty.all(const Color(0xff40BFFF)),
                    //   // fixedSize: MaterialStateProperty.all(Size(Get.width, 54)),
                    // ),
                    onPressed: () {},
                    child: const Text(
                      "Add to cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        // fontSize: 13
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Icon(Icons.shopping_cart)
          // FlatButton(
          //   onPressed: () {},
          //   highlightColor: Colors.white,
          //   splashColor: Colors.white,
          //   focusColor: Colors.white,
          //   color: Colors.white,
          //   child: Text(
          //     "Read More",
          //     style: TextStyle(color: Colors.blue),
          //   ),
          // ),

          // About the item

          // Card(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "About this item",
          //           style:
          //               TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          //         ),
          //         SizedBox(
          //           height: 15.0,
          //         ),
          //         Text(
          //           "Item details",
          //           style:
          //               TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          //         ),
          //         SizedBox(
          //           height: 15.0,
          //         ),
          //         ItemDetailInfo(
          //           itemProperty: "Condition",
          //           isSold: false,
          //           itemDescription: "New",
          //           isButton: false,
          //         ),
          //         SizedBox(
          //           height: 10.0,
          //         ),
          //         ItemDetailInfo(
          //             itemProperty: "Quantity",
          //             isSold: true,
          //             soldItemNumber: "3 sold",
          //             itemDescription: "30 available",
          //             isButton: true,
          //             icon: Icons.arrow_forward_ios_sharp),
          //         SizedBox(
          //           height: 15.0,
          //         ),
          //         ItemDetailInfo(
          //           itemProperty: "Model",
          //           isSold: false,
          //           itemDescription: "P12V4933",
          //           isButton: false,
          //         ),
          //         SizedBox(
          //           height: 15.0,
          //         ),
          //         ItemDetailInfo(
          //           itemProperty: "MPN",
          //           isSold: false,
          //           itemDescription: "P12V4933",
          //           isButton: false,
          //         ),
          //         SizedBox(
          //           height: 15.0,
          //         ),
          //         ItemDetailInfo(
          //           itemProperty: "Color Mode",
          //           isSold: false,
          //           itemDescription: "Color",
          //           isButton: false,
          //         ),
          //         SizedBox(
          //           height: 15.0,
          //         ),
          //         Divider(
          //           height: 1.5,
          //           color: Colors.grey,
          //           thickness: 0.7,
          //         ),
          //         SizedBox(
          //           height: 5.0,
          //         ),
          //         Text(
          //           "Posted on",
          //           style: TextStyle(fontSize: 16.0, color: Colors.grey[500]),
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text("Posted on 9 Mar at 5:23 PM"),
          //             IconButton(
          //                 splashColor: Colors.white,
          //                 highlightColor: Colors.white,
          //                 icon: Icon(
          //                   _onHeartClick
          //                       ? Icons.favorite_border
          //                       : Icons.favorite,
          //                   color: Colors.red,
          //                 ),
          //                 onPressed: _touched)
          //           ],
          //         ),
          //         Divider(
          //           height: 1.5,
          //           color: Colors.grey,
          //           thickness: 0.7,
          //         ),
          //         SizedBox(
          //           height: 10.0,
          //         ),
          //         Row(
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.only(right: 10.0),
          //               child: Container(
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(50.0),
          //                     color: Colors.blue,
          //                   ),
          //                   child: IconButton(
          //                       icon: Icon(
          //                         Icons.message,
          //                         color: Colors.white,
          //                       ),
          //                       onPressed: () {})),
          //             ),
          //             Expanded(
          //               child: FlatButton(
          //                 onPressed: () {},
          //                 highlightColor: Colors.white,
          //                 splashColor: Colors.blue,
          //                 focusColor: Colors.white,
          //                 color: Colors.white,
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(15.0),
          //                     side: BorderSide(color: Colors.blue)),
          //                 child: Text(
          //                   "Add to Shopping Cart",
          //                   style: TextStyle(color: Colors.blue),
          //                 ),
          //               ),
          //             )
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
