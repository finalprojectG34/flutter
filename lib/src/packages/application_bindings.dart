import 'package:get/get.dart';
import 'package:sms/data/data_access/item_operation.dart';
import 'package:sms/data/repository/category_repository.dart';
import 'package:sms/data/repository/category_repository.dart';
import 'package:sms/data/repository/item_repository.dart';
import 'package:sms/data/repository/shop_repository.dart';
import 'package:sms/data/repository/user_repository.dart';
import 'package:sms/src/packages/shared_preferences.dart';
import 'package:sms/src/screens/auth/reset_password/resetCtx.dart';
import 'package:sms/src/screens/category_page/categories_list_ctx.dart';
import 'package:sms/src/screens/category_page/categories_list_ctx.dart';
import 'package:sms/src/screens/shops_list/shops_list_ctx.dart';

import '../../data/repository/cart_repository.dart';
import '../../data/repository/order_repository.dart';
import '../screens/add_item/add_item_ctx.dart';
import '../screens/auth/login/loginCtx.dart';
import '../screens/auth/signup/signupCtx.dart';
import '../screens/cart_page/cart_page_ctx.dart';
import '../screens/home_page/AppCtx.dart';
import '../screens/items/item_list_ctx.dart';
import '../screens/order_page/order_page_ctx.dart';
import '../screens/profile_page/changePassCtx.dart';
import '../screens/profile_page/profile_page_ctx.dart';
import '../screens/profile_page/update_profile_ctx.dart';
import '../screens/reviews/repository.review.dart';
import '../screens/reviews/review_ctx.dart';
import '../screens/search_item/search_item_ctx.dart';
import 'graphql_client.dart';

class ApplicationBindings implements Bindings {
  ApplicationBindings();

  final UserRepository _userRepository =
      UserRepository(gqlClient: Client().connect);

  final ItemRepository _itemRepository = ItemRepository(
    itemOperation: ItemOperation(gqlClient: Client().connect),
  );

  final CartRepository _cartRepository = CartRepository(
    gqlClient: Client().connect,
  );

  final OrderRepository _orderRepository = OrderRepository(
    gqlClient: Client().connect,
  );

  final ReviewRepository _reviewRepository = ReviewRepository(
    gqlClient: Client().connect,
  );

  final ShopRepository _shopRepository =
      ShopRepository(gqlClient: Client().connect);

  final CategoryRepository _categoryRepository =
      CategoryRepository(gqlClient: Client().connect);

  @override
  void dependencies() {
    Get.put(SharedPreference());

    Get.lazyPut(
      () => LoginController(userRepository: _userRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => CategoryListController(categoryRepository: _categoryRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => AppController(itemRepository: _itemRepository),
      fenix: true,
    );
    Get.lazyPut(
        () => AddItemController(
              itemRepository: _itemRepository,
              itemOperation: ItemOperation(gqlClient: Client().connect),
            ),
        fenix: true);
    Get.lazyPut(
      () => CartPageController(cartRepository: _cartRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => ProfilePageController(userRepository: _userRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => OrderPageController(orderRepository: _orderRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => SignUpController(userRepository: _userRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => SearchController(
        itemRepository: _itemRepository,
        itemOperation: ItemOperation(gqlClient: Client().connect),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ResetController(userRepository: _userRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => ShopsListController(shopRepository: _shopRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => ItemListController(itemRepository: _itemRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => UpdateProfileController(itemRepository: _itemRepository),
      fenix: true,
    );
    Get.lazyPut(
      () => ChangePasswordController(itemRepository: _itemRepository),
      fenix: true,
    );

    Get.lazyPut(
      () => ReviewController(reviewRepository: _reviewRepository),
      fenix: true,
    );
  }
}
