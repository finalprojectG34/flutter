import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:sms/src/app.dart';
import 'package:sms/src/packages/application_bindings.dart';
import 'package:sms/src/screens/screens.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ShoppingApp(),
  );
}

class ShoppingApp extends StatelessWidget {
  ShoppingApp();

  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  // final httpLink = HttpLink("https://finalproject34.herokuapp.com/graphql");

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink("https://finalproject34.herokuapp.com/graphql")));
  String query = '''
  query GetAllCategories{
  getAllCategories{
    id
    name
  }
}
  ''';

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      child: GetMaterialApp(
        title: 'Sms',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialBinding: ApplicationBindings(),
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.blue,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold))),
      ),
      client: client,
    );
  }
}
