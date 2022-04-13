import 'package:flutter/material.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    Key key,
    @required this.active,
  }) : super(key: key);

  final MaterialColor active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
        ),
        children: [
          // DashboardItem(color: active),
          DashboardItem(color: active),
          CardLook(ontap: ()=>{Navigator.pushNamed(context, "/home")},),
          CardLook(ontap: ()=>{Navigator.pushNamed(context, "/category")},),
          CardLook(ontap: ()=>{Navigator.pushNamed(context, "/user")},),
          CardLook(ontap: ()=>{Navigator.pushNamed(context, "/user")},),



          DashboardCard(
            color: active,
            icons: Icons.tag_faces,
            text: "Sold",
            value: "120",
          ),
          DashboardCard(
            color: active,
            icons: Icons.tag_faces,
            text: "Sold",
            value: "120",
          ),
          DashboardCard(
            color: active,
            icons: Icons.tag_faces,
            text: "Sold",
            value: "120",
          ),
          DashboardCard(
            color: active,
            icons: Icons.tag_faces,
            text: "Sold",
            value: "120",
          ),
          DashboardCard(
            color: active,
            icons: Icons.people_outline,
            text: "users",
            value: "10",
          ),
          DashboardCard(
            color: active,
            icons: Icons.category,
            text: "Categ",
            value: "100",
          ),
          DashboardCard(
            color: active,
            icons: Icons.track_changes,
            text: "Products",
            value: "100",
          ),
          DashboardCard(
            color: active,
            icons: Icons.tag_faces,
            text: "Sold",
            value: "120",
          )
        ],
      ),
    );
  }
}

//main one
class CardLook extends StatelessWidget {
  CardLook({this.ontap});
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      // child: Container(
      //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      //   padding: const EdgeInsets.fromLTRB(6, 80, 6, 6),
      //
      //
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(5.0),
      child: Container(
        height: 20.0,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
        // margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
              decoration: BoxDecoration(color: Colors.greenAccent),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    alignment: Alignment.center,
                    child: Text(
                      "text one".toUpperCase(),
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "\$ 40,000",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Expanded( child: Container()),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.fact_check_outlined,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      //   ),
      // ),
    );
  }
}

// =================== Single card layouts ===========================\

class DashboardCard extends StatelessWidget {
  final IconData icons;
  final String text;
  final String value;
  final MaterialColor color;

  DashboardCard({this.icons, this.text, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        child: ListTile(
            title: FlatButton.icon(
              onPressed: null,
              icon: Icon(icons),
              label: Text(text),
            ),
            subtitle: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: 60.0),
            )),
      ),
    );
  }
}

//Rectangular one
class DashboardItem extends StatelessWidget {
  const DashboardItem({this.color, this.middle});

  final MaterialColor color;
  final Widget middle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 3.0),
              decoration: BoxDecoration(color: Colors.orangeAccent),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  alignment: Alignment.center,
                  child: Text(
                    "text one".toUpperCase(),
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                ),
                Text(
                  "text 2",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            )),
            // Expanded( child: Container()),
            Icon(Icons.ac_unit),
          ],
          // leading: Expanded(child: Container(decoration: const BoxDecoration(color: Colors.blue),),),
        ),
      ),
    );
  }
}
