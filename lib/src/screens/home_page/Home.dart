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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          return null;
        },
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            //Header
            _header(context),
            //Banner
            _banner(context),
            SizedBox(height: 10.0,),
            Text('New Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),

            //====================== horizontal scroll
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
              child: InfiniteItem(),


            ),
        ),

            SizedBox(height: 10.0,),

            Padding(child:Text('Explore Popular Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
            ),padding: EdgeInsets.all(8.0),
            ),
            //Categories

            _popularCategories(context),



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
                  )))
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
                  "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"))),
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
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.redAccent),
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
            onPressed: (){
              
            },
            color: Colors.blue,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          ),


        ],
      ),
    );
  }

  Widget _popularCategories(BuildContext context){
      return GridView.count(crossAxisCount: 3,children: [
         _categoryItem(context, Constants.foodImagePath, "Food"),
        _categoryItem(context, Constants.candyImagePath, "Candies"),
        _categoryItem(context, Constants.watchImagePath, "Watches"),
        _categoryItem(context, Constants.sneakersImagePath, "Sneakers"),
        _categoryItem(context, Constants.cosmeticsImagePath, "Beauty"),
        _categoryItem(context, Constants.sampleImagePath, "Smartphones")
      ],
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing:5,
        padding: EdgeInsets.all(7),
        mainAxisSpacing: 5,



      );
  }

  Widget _categoryItem(BuildContext context,String imagePath,String title){

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

Widget itemView(BuildContext ctx,Item item)=> Container(
  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
  width: 150,
  child: Card(
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () => {},
      child: Column(
        children: [
          Image.network(
            Constants.watchImagePath
          ),
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

