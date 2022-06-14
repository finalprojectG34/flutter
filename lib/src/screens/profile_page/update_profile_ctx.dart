import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sms/data/repository/item_repository.dart';
import 'package:sms/src/screens/home_page/AppCtx.dart';

class UpdateProfileController extends GetxController {
  final ItemRepository itemRepository;

  UpdateProfileController({required this.itemRepository});

  final storage = Get.find<FlutterSecureStorage>();
  AppController appController = Get.find();
  RxBool isUpdateProfileLoading = false.obs;
  RxString err = ''.obs;
  RxBool updateError = false.obs;
  bool? isProfileUpdated;

  updateProfile(variable) async {
    isUpdateProfileLoading(true);
    print('var $variable');
    try {
      isProfileUpdated = await itemRepository.updateProfile(variable);
      print(isProfileUpdated);
      print(variable['phone']);
      if (isProfileUpdated == true) {
        if (variable['firstName'] != null) {
          await storage.write(key: 'firstName', value: variable['firstName']);
          appController.firstName(variable['firstName']);
        }
        if (variable['lastName'] != null) {
          await storage.write(key: 'lastName', value: variable['lastName']);
          appController.lastName(variable['lastName']);
        }
        if (variable['phone'] != null) {
          print(variable['phone']);
          await storage.write(key: 'phone', value: variable['phone']);
          appController.phone(variable['phone']);
          print('ph ${appController.phone.value}');
        }
        EasyLoading.showSuccess('Profile updated successfully',
            dismissOnTap: true, maskType: EasyLoadingMaskType.black);
        Get.back();
      }
    } on TimeoutException catch (e) {
      updateError(true);
      err(e.message);
      EasyLoading.showError(e.message!,
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(seconds: 3));
    } catch (e) {
      updateError(true);
      err('Connection error');
      EasyLoading.showError('Connection error',
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(seconds: 3));
    }
    isUpdateProfileLoading(false);
  }
}
