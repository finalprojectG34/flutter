import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/order.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ListTile(
            title: const Text('Orders'),
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
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
              // Navigator.pop(context);
            },
            leading: const Icon(
              Icons.exit_to_app,
              color: Color(0xFF0D90EE),
            ),
          )
        ],
      ),
    );
  }
}
