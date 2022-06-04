import 'package:flutter/material.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/screens.dart';

import '../add_item/add_item.dart';
import '../add_item/category_select_list.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/home':
        return MaterialPageRoute(builder: (context) => App());
      case '/add_item':
        return MaterialPageRoute(
            builder: (context) => const AddItem(
                  hasAppbar: true,
                ));

      case '/add_image':
        return MaterialPageRoute(builder: (context) => HomePagee());
      case '/select_category':
        return MaterialPageRoute(
            builder: (context) => CategorySelectList(
                  isOnSubcategoryPage: false,
                ));
      // case ItemDetails.routeName:
      //   return MaterialPageRoute(builder: (_) => ItemDetails(args));
      // case CategoriesPage.pathName:
      //   return MaterialPageRoute(builder: (_) => CategoriesPage());

      //  ===================== Admin =============
      // //     Items
      // case PageRoutes.add_edit_items:
      //   return MaterialPageRoute(
      //       builder: (context) => AddEditProduct(args: args));
      // case ItemsList.routeName:
      //   return MaterialPageRoute(builder: (_) => ItemsList());
      //
      // case PageRoutes.add_edit_users:
      //   return MaterialPageRoute(
      //       builder: (context) => AddEditUsers(args: args));
      // case PageRoutes.list_users:
      //   return MaterialPageRoute(builder: (_) => UsersList());
      //
      //   // /Categories
      // case AddCategory.pathName:
      //   return MaterialPageRoute(builder: (_) => AddCategory());
      // case EditCategory.pathName:
      //   return MaterialPageRoute(builder: (_) => EditCategory(category: args));
      // case CategoryList.pathName:
      //   return MaterialPageRoute(builder: (_) => CategoryList());
      //
      // //  Profile Routes
      // case ProfilePage.pathName:
      //   return MaterialPageRoute(builder: (_) => ProfilePage());
      // case UpdateProfile.pathName:
      //   return MaterialPageRoute(builder: (_) => UpdateProfile(user: args));
      // case ChangePassword.pathName:
      //   return MaterialPageRoute(builder: (_) => ChangePassword(user: args));
      // case AddAddress.pathName:
      //   return MaterialPageRoute(builder: (_) => AddAddress());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class PageArgument {
  final dynamic item;
  final bool? edit;

  PageArgument({this.item, this.edit});
}
