import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/components/appbar.dart';
import 'package:sms/src/screens/drawer/drawer.dart';
import 'package:sms/src/screens/screens.dart';
import '../auth/login/login.dart';
import 'AppCtx.dart';

part 'app_components.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool searchBar = false;
  late Widget body;

  // int _selectedIndex = 0;
  late AppBar appbar;
  late String appbarName;

  @override
  void initState() {
    super.initState();
    body = const Home(
      hasSearchBar: false,
    );
    // appbar = AppBarComponent.setAppBar('Home');
    // appbarName = 'Home';
  }

  Widget _mapIndexToPage(int index) {
    final AppController appController = Get.find();
    switch (index) {
      case 1:
        // _selectedIndex = index;
        appController.changePage('Explore', index);
        return Text('Category page');
      // CategoriesPage();
      case 2:
        appController.changePage('Cart', index);
        return Text('profile page');
      // if (state.status == AuthenticationStatus.authenticated) {
      //   return ProfilePage();
      // }
      // return Text('Login page');
      case 3:
        appController.changePage('Offer', index);
        return Text('offer detail');
      // ItemDetails(Item(name: 'name',price: '230',category: 'cat',description: 'some desc',));
      case 4:
        appController.changePage('Account', index);
        return Login();
      case 0:
      default:
        appController.changePage('Home', index);
        return Home(
          hasSearchBar: appController.hasSearchIcon.isFalse,
        );
    }
  }

  // void _onTabItemTapped(int index) {
  //   setState(
  //     () {
  //       switch (index) {
  //         case 0:
  //           body = const Home(
  //             hasSearchBar: false,
  //           );
  //           // appbar = AppBarComponent.setAppBar('Home');
  //           // appbarName = 'Home';
  //           break;
  //         case 1:
  //           body = const Home();
  //           // appbar = AppBarComponent.setAppBar('Explore');
  //
  //           break;
  //         case 2:
  //           body = const Home();
  //           // appbar = AppBarComponent.setAppBar('Cart');
  //           break;
  //         case 3:
  //           body = const Home();
  //           // appbar = AppBarComponent.setAppBar('Offer');
  //           break;
  //         case 4:
  //           body = Login();
  //           // appbar = AppBarComponent.setAppBar('Account');
  //           break;
  //       }
  //       _selectedIndex = index;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      builder: (ctx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(ctx.pageName.value),
            elevation: 2,
            centerTitle: true,
            actions: [
              if (ctx.hasSearchIcon.value)
                IconButton(
                  onPressed: () {
                    ctx.disableSearchIcon();
                  },
                  icon: const Icon(Icons.search),
                ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              )
            ],
          ),
          body: _mapIndexToPage(ctx.selectedIndex.value),
          drawer: const DrawerPage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: ctx.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: _mapIndexToPage,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Explore'),
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
      },
    );
  }

  // Widget _mapIndexToPage(int index) {
  //   final AppController appController = Get.find();
  //   switch (index) {
  //     case 1:
  //       return Text('Category page');
  //     // CategoriesPage();
  //     case 2:
  //       return Text('profile page');
  //     // if (state.status == AuthenticationStatus.authenticated) {
  //     //   return ProfilePage();
  //     // }
  //     // return Text('Login page');
  //     case 3:
  //       return Text('item detail');
  //     // ItemDetails(Item(name: 'name',price: '230',category: 'cat',description: 'some desc',));
  //     case 0:
  //     default:
  //       appController.changePageName('Home');
  //       return Home();
  //   }
  //
  //   _selectedIndex = index;
  // }

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
