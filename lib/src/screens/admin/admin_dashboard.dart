import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sms/src/app.dart';
import 'admin_dashboard_widgets.dart';

import 'item/listItems.dart';

class AdminDashboard extends StatelessWidget {
  static const pathName = '/dashboard';
  final MaterialColor active = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          title: Text("admin"),
          actions: [],
          // ==================== These are the tabs ========================
          bottom: TabBar(
            tabs: [
              Container(
                child: FlatButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.dashboard,
                    color: Colors.blue,
                  ),
                  label: Text("Dashboard"),
                ),
              ),
              Container(
                child: FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.sort),
                  label: Text("Manage"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Mange(),
            DashBoard(),
          ],
        ),
      ),
    );
  }
}

// ============ these are the two tab pages==========
class DashBoard extends StatelessWidget {
  final MaterialColor active = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ListTile(
            title: Text(
              'Revenues',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, color: Colors.black26),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/user");
            },
            subtitle: FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.attach_money,
                size: 30.0,
                color: Colors.amberAccent,
              ),
              label: Text(
                '12,000',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.lightBlue),
              ),
            ),
          ),
        ),
        GridBuilder(active: active),
      ],
    );
  }
}

class Mange extends StatelessWidget {
  final MaterialColor active = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Card(
        child: ListTile(
          leading: Icon(Icons.list),
          title: Text("Products list"),
          onTap: () => Navigator.of(context).pushNamed(ItemsList.routeName),
        ),
      ),
      Card(
        // margin:EdgeInsets.fromLTRB(20,0,0,0),
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Add product"),
          onTap: () => Navigator.of(context).pushNamed(
            PageRoutes.add_edit_items,
            arguments: PageArgument(edit: false),
          ),
        ),
      ),
      // Divider(),
      //Manege category

      Card(
        child: ListTile(
          leading: Icon(Icons.category),
          title: Text("Category List"),
          onTap: () => Navigator.of(context).pushNamed(
            CategoryList.pathName,
          ),
        ),
      ),
      Card(
        // margin:EdgeInsets.fromLTRB(20,0,0,0),
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Add Category"),
          onTap: () => Navigator.of(context).pushNamed(
            AddCategory.pathName,
            arguments: PageArgument(edit: false),
          ),
        ),
      ),

      Card(
        child: ListTile(
          leading: Icon(Icons.supervisor_account_outlined),
          title: Text("Users List"),
          onTap: () => Navigator.of(context).pushNamed(
            PageRoutes.list_users,
          ),
        ),
      ),
      Card(
        // margin:EdgeInsets.fromLTRB(20,0,0,0),
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Add User"),
          onTap: () => Navigator.of(context).pushNamed(
            PageRoutes.add_edit_users,
            arguments: PageArgument(edit: false),
          ),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.account_circle_outlined),
          title: Text("Roles List"),
          onTap: () => Navigator.of(context).pushNamed(
            PageRoutes.list_roles,
          ),
        ),
      ),
      Card(
        // margin:EdgeInsets.fromLTRB(20,0,0,0),
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text("Add Role"),
          onTap: () => Navigator.of(context).pushNamed(
            PageRoutes.add_edit_roles,
            arguments: PageArgument(edit: false),
          ),
        ),
      ),

    ]);
  }
}
