import 'package:get/get.dart';
import 'package:sms/src/packages/shared_preferences.dart';

import '../screens/auth/login/loginCtx.dart';
import '../screens/home_page/AppCtx.dart';

class ApplicationBindings implements Bindings {
  ApplicationBindings();

  @override
  void dependencies() {
    Get.put(SharedPreference());
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => AppController(), fenix: true);
  }
}
