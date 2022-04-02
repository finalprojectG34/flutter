import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/bloc/Auth/auth_bloc.dart';
import 'package:sms/src/bloc/Login/login_bloc.dart';

import 'package:sms/src/bloc/navigation/NavigationBloc.dart';
import 'package:sms/src/bloc/navigation/NavigationEvent.dart';
import 'package:sms/src/screens/auth/login.dart';
import 'package:sms/src/screens/home_page/item_detail/item_detail.dart';
import 'package:sms/src/screens/screens.dart';

part 'app_components.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool searchBar = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<NavigationBloc, Routes>(builder: (context, routes) {
      return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authenticationState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.blue),
            title: Text(
              _mapIndexToTitle(routes.index),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            titleSpacing: 0,
            actions: [
              if (!searchBar)
                IconButton(
                    onPressed: () {
                      setState(() {
                        searchBar = true;
                      });
                    },
                    icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
            ],
          ),
          body: _mapIndexToRoutes(authenticationState, routes.index, searchBar),

          // _mapIndexToRoutes(authenticationState, routes.index),
          drawer: _Drawer(routes: routes),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _roundIndex(routes.index),
            type: BottomNavigationBarType.fixed,
            onTap: (i) {
              switch (i) {
                case 0:
                  context.read<NavigationBloc>().add(Navigated(Routes.home));
                  break;
                case 1:
                  context
                      .read<NavigationBloc>()
                      .add(Navigated(Routes.category));
                  break;
                case 2:
                  context.read<NavigationBloc>().add(Navigated(Routes.profile));
                  break;
                case 3:
                  context.read<NavigationBloc>().add(Navigated(Routes.admin));
                  break;
              }
            },
            items: [
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
              if (authenticationState.status ==
                      AuthenticationStatus.authenticated &&
                  authenticationState.user.role == "ADMIN")
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Admin'),
            ],
          ),
        );
      });
    });
  }

  int _roundIndex(int index) {
    return index > 3 ? 0 : index;
  }

  Widget _mapIndexToRoutes(
      AuthenticationState state, int index, bool hasSearchBar) {
    switch (index) {
      case 1:
        return CategoriesPage();
      case 2:
        if (state.status == AuthenticationStatus.authenticated) {
          return ProfilePage();
        }
        return BlocProvider(
          create: (ctx) => LoginBloc(
              authenticationRepository: ctx.read<AuthenticationRepository>(),
              authenticationBloc: ctx.read<AuthenticationBloc>()),
          child: Login(),
        );
      case 3:
        return ItemDetails(Item(name: 'name',price: '230',category: 'cat',description: 'some desc',));
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
