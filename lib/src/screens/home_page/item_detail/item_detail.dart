import 'package:flutter/material.dart';

import 'information.dart';
import 'item_detail_info.dart';
import '../../../models/models.dart';

class ItemDetails extends StatefulWidget {
  static const routeName = '/itemDetail';
  final Item item;

  ItemDetails(this.item);

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

  List<String> size = ["XS", "S", "M", "L", "XL", "XXL"];
  List<String> colors = ["Red", "Black", "Green", "White", "Blue", "Yellow"];

  final _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {Navigator.of(context).pop();},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: TextField(
          controller: _controller,
          autocorrect: true,
          cursorColor: Color(0xFF384C70),
          style: TextStyle(
            color: Color(0xFF384C70),
            fontSize: 15.0,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Search Product',
            hintStyle: TextStyle(
              color: Color(0xFF384C70),
            ),
          ),
        ),
        actions: [
          Stack(alignment: AlignmentDirectional.centerEnd, children: [
            Icon(
              Icons.notifications,
              color: Colors.black54,
              size: 30,
            ),
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffc32c37),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      _shopCounter.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
              Icon(
                Icons.shopping_cart_rounded,
                color: Colors.black54,
                size: 30,
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 5),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc32c37),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        _notificationCounter.toString(),
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/apple.png",
                    height: 400,
                  ),
                ),
                Container(
                  width: 35.0,
                  margin: EdgeInsets.only(left: 46.0, bottom: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        "1/5",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$242",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    _notTouched ? Icons.favorite_border : Icons.favorite,
                    color: Colors.red,
                    size: 20.0,
                  ),
                  onPressed: _touched,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("IPod Touch 2019 7th Generation - 32GB SpaceGrey MVHW2"),
            SizedBox(
              height: 15.0,
            ),
            IntrinsicHeight(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    "5.0 ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "(11)",
                    style: TextStyle(color: Colors.grey),
                  ),
                  VerticalDivider(
                    thickness: 0.7,
                    color: Colors.grey,
                    width: 35.0,
                  ),
                  Text(
                    "17 ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Sale",
                    style: TextStyle(color: Colors.grey),
                  ),
                  VerticalDivider(
                    thickness: 0.7,
                    color: Colors.grey,
                    width: 35.0,
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  Text(
                    "Addis Ababa",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Variant",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text("Size :"),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "XS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Container(
              height: 38.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: size.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: index == 0 ? Colors.blue : Colors.grey
                          // color: selected.map((e) => )

                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: index == 0 ? Colors.blue : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "${size[index]}",
                          style: TextStyle(
                              color: index == 0 ? Colors.white : Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text("Color :"),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Red",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: 38.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      // width: 25.0,
                      // height: 25.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: index == 0 ? Colors.blue : Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                        color: index == 0 ? Colors.blue : Colors.white,
                      ),
                      child: Text(
                        "${colors[index]}",
                        style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.black),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Delivery",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                        "Calculate the estimated cost for shipping goods to Addis Ababa, Ethiopia")),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () {},
                  iconSize: 30.0,
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            RowElement(
              description: "Weight",
              descriptionColor: Colors.grey,
              // isButton: false,
              status: "300 Gram",
              statusColor: Colors.grey,
            ),
            SizedBox(
              height: 10.0,
            ),
            RowElement(
              description: "Condition",
              descriptionColor: Colors.grey,
              // isButton: false,
              status: "Second",
              statusColor: Colors.grey,
            ),
            SizedBox(
              height: 10.0,
            ),
            RowElement(
              description: "Category",
              descriptionColor: Colors.grey,
              // isButton: false,
              status: "Electronic",
              statusColor: Colors.blue,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend nunc pellentesque, lobortis mi id, feugiat lacus. Integer at aliquet urna, eu vehicula urna. Vivamus condimentum tempor velit ac faucibus. Integer a nulla purus. Aliquam aliquam massa in sapien efficitur."),
            FlatButton(
              onPressed: () {},
              highlightColor: Colors.white,
              splashColor: Colors.white,
              focusColor: Colors.white,
              color: Colors.white,
              child: Text(
                "Read More",
                style: TextStyle(color: Colors.blue),
              ),
            ),

            // About the item

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About this item",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Item details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ItemDetailInfo(
                  itemProperty: "Condition",
                  isSold: false,
                  itemDescription: "New",
                  isButton: false,
                ),
                SizedBox(
                  height: 10.0,
                ),
                ItemDetailInfo(
                    itemProperty: "Quantity",
                    isSold: true,
                    soldItemNumber: "3 sold",
                    itemDescription: "30 available",
                    isButton: true,
                    icon: Icons.arrow_forward_ios_sharp),
                SizedBox(
                  height: 15.0,
                ),
                ItemDetailInfo(
                  itemProperty: "Model",
                  isSold: false,
                  itemDescription: "P12V4933",
                  isButton: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                ItemDetailInfo(
                  itemProperty: "MPN",
                  isSold: false,
                  itemDescription: "P12V4933",
                  isButton: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                ItemDetailInfo(
                  itemProperty: "Color Mode",
                  isSold: false,
                  itemDescription: "Color",
                  isButton: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Divider(
                  height: 1.5,
                  color: Colors.grey,
                  thickness: 0.7,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Posted on",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[500]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Posted on 9 Mar at 5:23 PM"),
                    IconButton(
                        splashColor: Colors.white,
                        highlightColor: Colors.white,
                        icon: Icon(
                          _onHeartClick
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: _touched)
                  ],
                ),
                Divider(
                  height: 1.5,
                  color: Colors.grey,
                  thickness: 0.7,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                              icon: Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              onPressed: () {})),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {},
                        highlightColor: Colors.white,
                        splashColor: Colors.blue,
                        focusColor: Colors.white,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.blue)),
                        child: Text(
                          "Add to Shopping Cart",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
