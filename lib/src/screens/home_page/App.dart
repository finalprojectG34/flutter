import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/drawer/drawer.dart';
import 'package:sms/src/screens/screens.dart';

import '../add_item/add_item.dart';
import '../auth/login/login.dart';
import '../cart_page/cart_page.dart';
import '../components/add_shop.dart';
import '../order_page/sent_order_detail.dart';
import 'AppCtx.dart';

part 'app_components.dart';

class App extends StatefulWidget {
  const App({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool searchBar = false;
  late Widget body;
  final storage = Get.find<FlutterSecureStorage>();

  // late OrderRespositoryImpl aa;
  late AppBar appbar;
  late String appbarName;
  late String? userRole;
  late bool hasShopId;
  String query = '''
  query GetAllItems{
  getAllItems{
    id
    name
  }
}
  ''';

  @override
  void initState() {
    super.initState();
    // aa = OrderRespositoryImpl(
    //   GraphQLClient(
    //       cache: GraphQLCache(),
    //       link: HttpLink("https://finalproject34.herokuapp.com/graphql")),
    // );
    // aa.getItems();
    getToken();
    getShopId();
    body = const Home(
      hasSearchBar: false,
    );

    // appbar = AppBarComponent.setAppBar('Home');
    // appbarName = 'Home';
  }

  getToken() async {
    String? value = await storage.read(key: 'token');
    print('token $value');
  }

  getShopId() async {
    hasShopId = await storage.read(key: 'shopId') != null;
    userRole = await storage.read(key: 'role');
    // userRole = 'SELLER';
    // hasShopId = true;
  }

  Widget _mapIndexToPage(int index) {
    final AppController appController = Get.find();
    getShopId();
    getToken();
    switch (index) {
      case 1:
        // _selectedIndex = index;
        appController.changePage('My Items', index);
        return SentOrderDetail();
      //   Query(
      //   options: QueryOptions(
      //     document: gql(query),
      //   ),
      //   builder: (QueryResult result, {fetchMore, refetch}) {
      //     if (result.hasException) {
      //       return Text(result.exception.toString());
      //     }
      //     if (result.isLoading) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     appController.itemList = ((result.data!['getAllItems'] as List)
      //             .map((json) => Item.fromJson(json))
      //             .toList())
      //         .obs;
      //     // return ListView.builder(
      //     //   itemBuilder: (context, index) => Text(
      //     //     appController.itemList![index].name!,
      //     //   ),
      //     //   itemCount: appController.itemList?.length,
      //     // );
      //     return PackageDeliveryTrackingPage();
      //   },
      // );
      // CategoriesPage();
      case 2:
        // return PackageDeliveryTrackingPage();
        if (appController.isAuthenticated.isFalse) {
          Get.snackbar(
              'Sign in', 'You need to sign in first before you add item',
              snackPosition: SnackPosition.BOTTOM);
          appController.changePage('Account', 4);
        } else if (hasShopId && userRole == 'SELLER') {
          appController.changePage('Add Item', index);
        } else if (hasShopId && userRole == 'USER') {
          appController.changePage('Pending', index);
        } else {
          appController.changePage('Register as seller', index);
        }
        return appController.isAuthenticated.isTrue
            ? hasShopId && userRole == 'SELLER'
                ? AddItem(
                    hasAppbar: false,
                  )
                : hasShopId && userRole == 'USER'
                    ? Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            'Your request to be a seller is under review. You will be a seller as soon as the review is complete.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    : AddShop(redirectFrom: 'home')
            : Container();

      // if (state.status == AuthenticationStatus.authenticated) {
      //   return ProfilePage();
      // }
      // return Text('Login page');
      case 3:
        appController.changePage('Cart', index);
        if (appController.isAuthenticated.isFalse) {
          Get.snackbar('Sign in',
              'You need to sign in first before you add item to cart',
              snackPosition: SnackPosition.BOTTOM);
          appController.changePage('Account', 4);
        }
        return appController.isAuthenticated.isTrue
            ? const CartPage()
            : Container();
      // ItemDetails(Item(name: 'name',price: '230',category: 'cat',description: 'some desc',));
      case 4:
        appController.getUserInfo();
        appController.changePage(
            appController.isAuthenticated.isTrue ? 'Profile' : 'Account',
            index);
        // return Login();
        return appController.isAuthenticated.isTrue ? ProfilePage() : Login();
      case 0:
      default:
        appController.changePage('Home', index);
        return Home(
          hasSearchBar: appController.hasSearchIcon.isFalse,
        );
    }
  }

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
              if (ctx.hasSearchIcon.value && ctx.selectedIndex.value == 0)
                IconButton(
                  onPressed: () {
                    ctx.disableSearchIcon();
                    ctx.isSearchBarActive(true);
                  },
                  icon: const Icon(Icons.search),
                ),
              ctx.isAuthenticated.isTrue
                  ? IconButton(
                      onPressed: () {
                        ctx.changePage('Cart', 3);
                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                    )
                  : Container()
            ],
          ),
          body: _mapIndexToPage(ctx.selectedIndex.value),
          drawer: DrawerPage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: ctx.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: _mapIndexToPage,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books_outlined),
                  label: 'My Items'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'Add'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline_rounded),
                label: ctx.isAuthenticated.isTrue ? 'Profile' : 'Account',
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
