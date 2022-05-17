import 'package:get/get.dart';
import 'package:sms/src/packages/shared_preferences.dart';

import '../screens/add_item/add_item_ctx.dart';
import '../screens/auth/login/loginCtx.dart';
import '../screens/home_page/AppCtx.dart';

class ApplicationBindings implements Bindings {
  ApplicationBindings();

  @override
  void dependencies() {
    Get.put(SharedPreference());
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => AppController(), fenix: true);
    Get.lazyPut(() => AddItemController(), fenix: true);
  }
}
