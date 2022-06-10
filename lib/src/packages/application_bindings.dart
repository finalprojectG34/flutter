import 'package:get/get.dart';
import 'package:sms/data/database_operations/item_operation.dart';
import 'package:sms/data/repository/item_repository.dart';
import 'package:sms/data/repository/user_repository.dart';
import 'package:sms/src/packages/shared_preferences.dart';
import 'package:sms/src/screens/auth/reset_password/resetCtx.dart';

import '../screens/add_item/add_item_ctx.dart';
import '../screens/auth/login/loginCtx.dart';
import '../screens/auth/signup/signupCtx.dart';
import '../screens/cart_page/cart_page_ctx.dart';
import '../screens/components/item_mini_view/add_to_cart_ctx.dart';
import '../screens/home_page/AppCtx.dart';
import '../screens/search_item/search_item_ctx.dart';
import 'graphql_client.dart';

class ApplicationBindings implements Bindings {
  ApplicationBindings();

  // final GraphQLClient _gqlClient = GraphQLClient(
  //   cache: GraphQLCache(),
  //   link: HttpLink("http://192.168.0.167:8000/graphql"),
  // );

  @override
  void dependencies() {
    Get.put(SharedPreference());
    Get.lazyPut(
      () => LoginController(
        userRepository: UserRepository(gqlClient: Client().connect),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => AppController(
        itemRepository: ItemRepository(
          itemOperation: ItemOperation(gqlClient: Client().connect),
        ),
      ),
      fenix: true,
    );
    Get.lazyPut(
        () => AddItemController(
              itemRepository: ItemRepository(
                itemOperation: ItemOperation(gqlClient: Client().connect),
              ),
            ),
        fenix: true);
    Get.lazyPut(
        () => AddToCartController(
              itemRepository: ItemRepository(
                itemOperation: ItemOperation(gqlClient: Client().connect),
              ),
            ),
        fenix: true);
    Get.lazyPut(
        () => CartPageController(
              itemRepository: ItemRepository(
                itemOperation: ItemOperation(gqlClient: Client().connect),
              ),
            ),
        fenix: true);
    Get.lazyPut(
        () => SignUpController(
            userRepository: UserRepository(gqlClient: Client().connect)),
        fenix: true);
    Get.lazyPut(
      () => SearchController(
        itemRepository: ItemRepository(
          itemOperation: ItemOperation(gqlClient: Client().connect),
        ),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ResetController(
          userRepository: UserRepository(gqlClient: Client().connect)),
      fenix: true,
    );
  }
}
