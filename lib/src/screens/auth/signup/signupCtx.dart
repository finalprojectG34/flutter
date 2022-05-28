import 'package:get/get.dart';

import '../../../../data/repository/user_repository.dart';
import '../../../models/user.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUserCreatedSuccessfully = false.obs;
  UserRepository userRepository = UserRepository();

  signupUser(variable) async {
    isLoading(true);
    User createdUser = await userRepository.signupUser(variable);
    isLoading(false);
    if (createdUser != null) {
      isUserCreatedSuccessfully(true);
    }
    print(createdUser.toString() + ' ############################aaaa');
    // isCategoryFetchedFromDB(true);
  }
}
