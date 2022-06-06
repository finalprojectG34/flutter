import 'package:get/get.dart';
import 'package:sms/src/packages/shared_preferences.dart';
import 'package:sms/src/screens/auth/reset_password/resetCtx.dart';

import '../screens/add_item/add_item_ctx.dart';
import '../screens/auth/login/loginCtx.dart';
import '../screens/auth/signup/signupCtx.dart';
import '../screens/cart_page/cart_page_ctx.dart';
import '../screens/components/item_mini_view/add_to_cart_ctx.dart';
import '../screens/home_page/AppCtx.dart';
import '../screens/search_item/search_item_ctx.dart';

class ApplicationBindings implements Bindings {
  ApplicationBindings();

  @override
  void dependencies() {
    Get.put(SharedPreference());
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => AppController(), fenix: true);
    Get.lazyPut(() => AddItemController(), fenix: true);
    Get.lazyPut(() => AddToCartController(), fenix: true);
    Get.lazyPut(() => CartPageController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);
    Get.lazyPut(() => ResetController(), fenix: true);
  }
}
