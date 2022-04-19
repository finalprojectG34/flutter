import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/components/appbar.dart';
import 'package:sms/src/screens/drawer/drawer.dart';

// import 'package:sms/src/bloc/Login/login_bloc.dart';
//
// import 'package:sms/src/bloc/navigation/NavigationBloc.dart';
// import 'package:sms/src/bloc/navigation/NavigationEvent.dart';
// import 'package:sms/src/screens/auth/login.dart';
import 'package:sms/src/screens/home_page/item_detail/item_detail.dart';
import 'package:sms/src/screens/screens.dart';

import '../auth/login/login.dart';

part 'app_components.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool searchBar = false;
  late Widget body;
  int _selectedIndex = 0;
  late AppBar appbar;

  @override
  void initState() {
    super.initState();
    body = const Home(
      hasSearchBar: false,
    );
    appbar = AppBarComponent.setAppBar('Home');
  }

  void _onTabItemTapped(int index) {
    setState(
      () {
        switch (index) {
          case 0:
            body = const Home(
              hasSearchBar: false,
            );
            appbar = AppBarComponent.setAppBar('Home');
            break;
          case 1:
            body = const Home();
            appbar = AppBarComponent.setAppBar('Explore');

            break;
          case 2:
            body = const Home();
            appbar = AppBarComponent.setAppBar('Cart');
            break;
          case 3:
            body = const Home();
            appbar = AppBarComponent.setAppBar('Offer');
            break;
          case 4:
            body = Login();
            appbar = AppBarComponent.setAppBar('Account');
            break;
        }
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      // AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   iconTheme: IconThemeData(color: Colors.blue),
      //   title: Text(
      //     _mapIndexToTitle(1),
      //     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      //   ),
      //   titleSpacing: 0,
      //   actions: [
      //     if (!searchBar)
      //       IconButton(
      //           onPressed: () {
      //             setState(() {
      //               searchBar = true;
      //             });
      //           },
      //           icon: Icon(Icons.search)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
      //   ],
      // ),
      body: body,

      // _mapIndexToRoutes(authenticationState, routes.index),
      drawer: const DrawerPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTabItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined), label: 'Offer'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Account',
          ),
          // if (authenticationState.status ==
          //     AuthenticationStatus.authenticated &&
          //     authenticationState.user.role == "ADMIN")
          //   BottomNavigationBarItem(
          //       icon: Icon(Icons.dashboard), label: 'Admin'),
        ],
      ),
    );
  }


  Widget _mapIndexToRoutes(int index, bool hasSearchBar) {
    switch (index) {
      case 1:
        return Text('Category page');
      // CategoriesPage();
      case 2:
        return Text('profile page');
      // if (state.status == AuthenticationStatus.authenticated) {
      //   return ProfilePage();
      // }
      // return Text('Login page');
      case 3:
        return Text('item detail');
      // ItemDetails(Item(name: 'name',price: '230',category: 'cat',description: 'some desc',));
      case 0:
      default:
        return Home(
          hasSearchBar: hasSearchBar,
        );
    }
  }

  String _mapIndexToTitle(int index) {
    switch (index) {
      case 1:
        return 'Category';
      case 2:
        return 'Profile';
      case 3:
        return 'Admin';
      case 0:
      default:
        return 'Home';
    }
  }
}
