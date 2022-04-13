import 'package:flutter/material.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/admin/item/add_edit_items.dart';
import 'package:sms/src/screens/admin/item/listItems.dart';
import 'package:sms/src/screens/admin/users/add_edit_users.dart';
import 'package:sms/src/screens/admin/users/list_users.dart';
import 'package:sms/src/screens/home_page/item_detail/item_detail.dart';
import 'package:sms/src/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/home':
        return MaterialPageRoute(builder: (context) => App());
      case ItemDetails.routeName:
        return MaterialPageRoute(builder: (_) => ItemDetails(args));
      case CategoriesPage.pathName:
        return MaterialPageRoute(builder: (_) => CategoriesPage());


      //  ===================== Admin =============
      //     Items
      case PageRoutes.add_edit_items:
        return MaterialPageRoute(
            builder: (context) => AddEditProduct(args: args));
      case ItemsList.routeName:
        return MaterialPageRoute(builder: (_) => ItemsList());

      case PageRoutes.add_edit_users:
        return MaterialPageRoute(
            builder: (context) => AddEditUsers(args: args));
      case PageRoutes.list_users:
        return MaterialPageRoute(builder: (_) => UsersList());

        // /Categories
      case AddCategory.pathName:
        return MaterialPageRoute(builder: (_) => AddCategory());
      case EditCategory.pathName:
        return MaterialPageRoute(builder: (_) => EditCategory(category: args));
      case CategoryList.pathName:
        return MaterialPageRoute(builder: (_) => CategoryList());

      //  Profile Routes
      case ProfilePage.pathName:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case UpdateProfile.pathName:
        return MaterialPageRoute(builder: (_) => UpdateProfile(user: args));
      case ChangePassword.pathName:
        return MaterialPageRoute(builder: (_) => ChangePassword(user: args));
      case AddAddress.pathName:
        return MaterialPageRoute(builder: (_) => AddAddress());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class PageArgument {
  final dynamic item;
  final bool edit;
  PageArgument({this.item, this.edit});
}

