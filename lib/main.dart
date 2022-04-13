import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:sms/src/bloc/Auth/auth_bloc.dart';
// bloc & data
import 'package:sms/src/bloc/bloc.dart';
import 'package:sms/src/bloc/navigation/NavigationBloc.dart';
import 'package:sms/src/packages/data_provider/data_provider.dart';
import 'package:sms/src/packages/repository/repository.dart';
//
import 'package:sms/src/app.dart';
import 'package:sms/bloc_observer.dart';
// ui
import 'package:sms/src/screens/screens.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final ItemRepository itemRepository = ItemRepository(
    dataProvider: ItemDataProvider(
      httpClient: http.Client(),
    ),
  );

  final CategoryRepository categoryRepository = CategoryRepository(
    dataProvider: CategoryDataProvider(
      httpClient: http.Client(),
    ),
  );

  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(
      httpClient: http.Client(),
    ),
  );
  final AuthenticationRepository authRepository = AuthenticationRepository(
    dataProvider: AuthDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider.value(value: itemRepository),
    RepositoryProvider.value(value: authRepository),
    RepositoryProvider.value(value: categoryRepository),
    RepositoryProvider.value(value: userRepository),
  ], child: ShoppingApp())
      // ShoppingApp(
      //     itemRepository: itemRepository,
      //   userRepository: userRepository,
      //   categoryRepository: categoryRepository,
      //
      // ),
      );
}

class ShoppingApp extends StatelessWidget {
  // final ItemRepository itemRepository;
  // final UserRepository userRepository;
  // final CategoryRepository categoryRepository;

  ShoppingApp();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
              authenticationRepository: context.read<AuthenticationRepository>(),
              userRepository:context.read<UserRepository>() )..add(AuthenticationStatusChanged(status: AuthenticationStatus.unknown))
        ),
        BlocProvider<ItemBloc>(
          create: (context) =>
              ItemBloc(itemRepository: context.read<ItemRepository>())
                ..add(ItemLoad()),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(
              categoryRepository: context.read<CategoryRepository>())
            ..add(CategoryLoad()),
        ),
        BlocProvider<UserBloc>(
          create: (context) =>
              UserBloc(userRepository: context.read<UserRepository>())
                ..add(UsersLoad()),
        ),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
      ],
      // value: this.itemRepository,
      // child: BlocProvider(
      //   create: (context) =>ItemBloc(itemRepository:  this.itemRepository)
      //         ..add(ItemLoad()),
      child: AppView(),
      // ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sms',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedItemColor: Colors.grey,

              selectedItemColor: Colors.blue,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
