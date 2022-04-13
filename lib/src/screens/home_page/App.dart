import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/bloc/Auth/auth_bloc.dart';
import 'package:sms/src/bloc/Login/login_bloc.dart';

import 'package:sms/src/bloc/navigation/NavigationBloc.dart';
import 'package:sms/src/bloc/navigation/NavigationEvent.dart';
import 'package:sms/src/screens/auth/login.dart';
import 'package:sms/src/screens/screens.dart';

part 'app_components.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<NavigationBloc, Routes>(
      builder: (context, routes) {
        return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authenticationState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.blue),
              title: Text(
                _mapIndexToTitle(routes.index),
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              titleSpacing: 0,
            ),
            body: _mapIndexToRoutes(authenticationState,routes.index),
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
                    context.read<NavigationBloc>().add(Navigated(Routes.category));
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
                    icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Category'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Account',
                ),
                if(authenticationState.status==AuthenticationStatus.authenticated&&authenticationState.user.role=="ADMIN")
                    BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard), label: 'Admin'),
              ],
            ),
          );
        });
      }
    );
  }

  int _roundIndex(int index) {
    return index > 3 ? 0 : index;
  }

  Widget _mapIndexToRoutes(AuthenticationState state,int index) {
    switch (index) {
      case 1:
        return CategoriesPage();
      case 2:
        if(state.status==AuthenticationStatus.authenticated){
          return ProfilePage();

        }
        return BlocProvider(create: (ctx)=>LoginBloc(authenticationRepository: ctx.read<AuthenticationRepository>(),authenticationBloc: ctx.read<AuthenticationBloc>()),
        child: Login(),
        );
      case 3:
        return AdminDashboard();
      case 0:
      default:
        return Home();
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
