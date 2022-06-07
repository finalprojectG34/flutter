import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/screens/home_page/AppCtx.dart';

import '../components/add_shop.dart';
import '../components/order.dart';
import '../components/shop_detail_component.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  // final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(builder: (ctx) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xFF0D90EE), shape: BoxShape.rectangle),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // context.read<NavigationBloc>().add(Navigated(Routes.home));
                // Navigator.pop(context);
              },
              // selected: routes == Routes.home,
              leading: const Icon(
                Icons.home,
                color: Color(0xFF0D90EE),
              ),
            ),
            // ListTile(
            //   title: const Text('Category'),
            //   onTap: () {
            //     // context.read<NavigationBloc>().add(Navigated(Routes.category));
            //     // Navigator.pop(context);
            //     Navigator.pushNamed(context, "/add_image");
            //   },
            //   leading: const Icon(
            //     Icons.category,
            //     color: Color(0xFF0D90EE),
            //   ),
            //   // selected: routes == Routes.category,
            // ),
            // if (ctx.isAuthenticated.isTrue)
            ListTile(
              title: const Text('Add product'),
              onTap: () {
                Navigator.pushNamed(context, "/add_item");
              },
              leading: const Icon(
                Icons.fiber_new,
                color: Color(0xFF0D90EE),
              ),
              // selected: routes == Routes.newProducts,
            ),
            if (ctx.isAuthenticated.isTrue)
              ListTile(
                title: const Text('My Items'),
                onTap: () {
                  Navigator.pushNamed(context, "/add_item");
                },
                leading: const Icon(
                  Icons.fiber_new,
                  color: Color(0xFF0D90EE),
                ),
                // selected: routes == Routes.newProducts,
              ),
            if (ctx.isAuthenticated.isTrue)
              ListTile(
                title: const Text('Received Orders'),
                onTap: () {
                  // context.read<NavigationBloc>().add(Navigated(Routes.admin));
                  // Navigator.pop(context);
                  Get.to(() => OrderPage());
                },
                leading: const Icon(
                  Icons.description,
                  color: Color(0xFF0D90EE),
                ),
                // selected: routes == Routes.admin,
              ),
            // if (ctx.isAuthenticated.isTrue)
            ListTile(
              title: const Text('Sent Orders'),
              onTap: () {
                // Navigator.pushNamed(context, "/add_item");
                Get.to(() => AddShop());
              },
              leading: const Icon(
                Icons.fiber_new,
                color: Color(0xFF0D90EE),
              ),
              // selected: routes == Routes.newProducts,
            ),
            ListTile(
              title: const Text('a'),
              onTap: () {
                Get.to(() => ShopDetail());
              },
              leading: const Icon(
                Icons.exit_to_app,
                color: Color(0xFF0D90EE),
              ),
            ),
            if (ctx.isAuthenticated.isTrue)
              const Divider(
                height: 1.0,
              ),
            // ListTile(
            //   title: const Text('Profile'),
            //   onTap: () {
            //     // context.read<NavigationBloc>().add(Navigated(Routes.profile));
            //     // Navigator.pop(context);
            //   },
            //   leading: const Icon(
            //     Icons.account_circle,
            //     color: Color(0xFF0D90EE),
            //   ),
            //   // selected: routes == Routes.profile,
            // ),

            if (ctx.isAuthenticated.isTrue)
              ListTile(
                title: const Text('Logout'),
                onTap: () async {
                  // context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
                  // Navigator.pop(context);
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: true, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Are you sure you want to log out?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Log out'),
                            onPressed: () async {
                              EasyLoading.instance.loadingStyle =
                                  EasyLoadingStyle.light;
                              EasyLoading.show(
                                status: 'Logging out ...',
                                maskType: EasyLoadingMaskType.black,
                              );
                              await ctx.logout();
                              ctx.isAuthenticated(false);
                              ctx.changePage('Home', 0);
                              EasyLoading.showSuccess('Logged out',
                                  maskType: EasyLoadingMaskType.black);
                              Get.offNamed('/');
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Color(0xFF0D90EE),
                ),
              )
          ],
        ),
      );
    });
  }
}
