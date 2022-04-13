part of 'App.dart';


class _Drawer extends StatelessWidget {
  final Routes routes;

  const _Drawer({this.routes,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                'Mart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                color: Color(0xFF0D90EE), shape: BoxShape.rectangle),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              context.read<NavigationBloc>().add(Navigated(Routes.home));
              Navigator.pop(context);
            },
            selected: routes == Routes.home,
            leading: Icon(
              Icons.home,
              color: Color(0xFF0D90EE),
            ),
          ),
          ListTile(
            title: Text('Category'),
            onTap: () {
              context.read<NavigationBloc>().add(Navigated(Routes.category));
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.category,
              color: Color(0xFF0D90EE),
            ),
            selected: routes == Routes.category,
          ),
          ListTile(
            title: Text('New Products'),
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            leading: Icon(
              Icons.fiber_new,
              color: Color(0xFF0D90EE),
            ),
            selected: routes == Routes.newProducts,
          ),
          ListTile(
            title: Text('Favorites'),
            onTap: () {
              context.read<NavigationBloc>().add(Navigated(Routes.admin));
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.favorite,
              color: Color(0xFF0D90EE),
            ),
            selected: routes == Routes.admin,
          ),
          Divider(
            height: 1.0,
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              context.read<NavigationBloc>().add(Navigated(Routes.profile));
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.account_circle,
              color: Color(0xFF0D90EE),
            ),
            selected: routes == Routes.profile,
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
              Navigator.pop(context);

            },
            leading: Icon(
              Icons.exit_to_app,
              color: Color(0xFF0D90EE),
            ),
          )
        ],
      ),
    );
  }
}


