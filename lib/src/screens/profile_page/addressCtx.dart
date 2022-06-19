import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sms/data/repository/item_repository.dart';
import 'package:sms/src/models/models.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

import '../../../data/repository/user_repository.dart';

class AddressController extends GetxController {
  final ItemRepository itemRepository;
  final UserRepository userRepository;

  AddressController(
      {required this.itemRepository, required this.userRepository});

  final storage = Get.find<FlutterSecureStorage>();

  // AppController appController = Get.find();
  RxBool isChangePasswordLoading = false.obs;
  RxString err = ''.obs;
  RxBool passwordError = false.obs;
  bool? isPasswordUpdated;

  RxString country = ''.obs;
  RxString city = ''.obs;
  RxString subCity = ''.obs;
  RxString streetName = ''.obs;

  User? authUser;

  @override
  void onInit() {
    super.onInit();
    getUserAddress();
  }

  getUserAddress() async {
    try {
      authUser = await itemRepository.getMe();

      if (authUser != null) {
        country('Ethiopia');
        city(authUser?.address?.city);
        subCity(authUser?.address?.subCity);
        streetName(authUser?.address?.addressName);
      } else {
        EasyLoading.showError('Some error happened',
            dismissOnTap: true, maskType: EasyLoadingMaskType.black);
      }
    } catch (e) {
      EasyLoading.showError('Some error happened',
          dismissOnTap: true, maskType: EasyLoadingMaskType.black);
    }
  }

  // updateUserAddress(Address _address) async {
  //   // isProfileLoading(true);
  //   try {
  //     Address temp = await userRepository.updateUserAddress(_address);
  //     if (temp != null) {
  //       print(temp);
  //       // country('Ethiopia');
  //       // city(temp.city);
  //       // subCity(temp.subCity);
  //       logTrace('str', temp.addressName);
  //       streetName(temp.addressName);
  //       //  getUserAddress();
  //       EasyLoading.showSuccess('Address updated successfully',
  //           dismissOnTap: true,
  //           maskType: EasyLoadingMaskType.black,
  //           duration: Duration(seconds: 2));
  //       Get.back();
  //     } else {
  //       EasyLoading.showError('Some error occurred',
  //           dismissOnTap: true,
  //           maskType: EasyLoadingMaskType.black,
  //           duration: const Duration(seconds: 2));
  //     }
  //     // address!(temp);
  //     //
  //     // await setUserAddress(temp);
  //     getUserAddress();
  //   } catch (e) {
  //     print(e);
  //     EasyLoading.showError(
  //       'Some error occurred',
  //       dismissOnTap: true,
  //       maskType: EasyLoadingMaskType.black,
  //       duration: const Duration(seconds: 2),
  //     );
  //     // errOccurred(true);
  //     // errorText("Please try again!");
  //   }
  //   // isProfileLoading(false);
  // }

  changePassword(variable) async {
    isChangePasswordLoading(true);

    try {
      isPasswordUpdated = await itemRepository.updatePassword(variable);
      if (isPasswordUpdated == true) {
        EasyLoading.showSuccess('Password changed successfully',
            dismissOnTap: true, maskType: EasyLoadingMaskType.black);
        Get.back();
      }
    } on TimeoutException catch (e) {
      passwordError(true);
      err(e.message);
      EasyLoading.showError(e.message!,
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(seconds: 2));
    } catch (e) {
      passwordError(true);
      // err('Connection error');
      EasyLoading.showError(e.toString(),
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(seconds: 2));
    }
    isChangePasswordLoading(false);
  }
}
