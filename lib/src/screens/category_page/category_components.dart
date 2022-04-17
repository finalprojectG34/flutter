part of 'category.dart';

Widget categoryTitle = Container(
  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
  child: Column(
    children: [
      Text(
        "Computers & office",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      ),
      Text(
        'Target / Electronics / Computers & office',
        style: TextStyle(color: Colors.grey[600]),
      )
    ],
  ),
);

Widget categoryButton = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Text('Shop by category',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
    ),
    Container(
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: TextButton(
        child: Text(
          'Show all',
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () => {},
      ),
    )
  ],
);

Widget allCategory = Container(
  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
  child: Center(
    child: TextButton(
      child: Text('See all 14 categories'),
      onPressed: () => {},
    ),
  ),
);

Widget itemCard = Container(
  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
  width: 150,
  child: Card(
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () => {},
      child: Column(
        children: [
          Image.asset(
            'images/travel_bag.jpg',
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Text('SAMSUNG LED TV 32 INCH HD DIGITAL - 32N4003'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Row(
              children: [
                Text(
                  '\$ 116',
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

class ItemCard extends StatelessWidget {
  final Item item;
  final double width;
  final double height;

  ItemCard({this.item, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      width: width,
      height: height,
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => {
            Navigator.pushNamed(context, ItemDetails.routeName, arguments: item)
          },
          child: Column(
            children: [
              Image.asset(
                'images/travel_bag.jpg',
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Text('SAMSUNG LED TV 32 INCH HD DIGITAL - 32N4003'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Row(
                  children: [
                    Text(
                      '\$ 116',
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
  }
}
