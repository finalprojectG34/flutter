import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sms/src/app.dart';

import '../../../../data/repository/user_repository.dart';
import '../../../models/user.dart' as user;
import '../../home_page/AppCtx.dart';
import '../verification/code_verification.dart';

class LoginController extends GetxController {
  final UserRepository userRepository;

  LoginController({required this.userRepository});

  var loading = false.obs;
  var error = false.obs;
  String verificationId = "";
  final AppController appController = Get.find();
  user.User? signedInUser;

  final storage = Get.find<FlutterSecureStorage>();

  signInUser(variable) async {
    // print(userVariable);
    // isLoading(true);
    try {
      signedInUser = await userRepository.signInUser(variable);
      if (signedInUser == null) {
        EasyLoading.showError('Try again',
            maskType: EasyLoadingMaskType.black,
            duration: const Duration(seconds: 3));
        // Get.back();
      } else {
        await storage.write(key: 'token', value: signedInUser?.token);
        await storage.write(key: "userId", value: signedInUser?.id);
        // await storage.write(key: 'user', value: jsonEncode(signedInUser));
        EasyLoading.showSuccess('Logged in successfully',
            maskType: EasyLoadingMaskType.black);
        AppController appController = Get.find();
        appController.changePage('Home', 0);
        appController.isAuthenticated(true);
        // Get.offNamed('/');
      }
    } catch (e) {
      print(e);
      EasyLoading.showError('Please try again',
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(seconds: 3));
      // Get.back();
    }
  }

  sendOtp(String phoneNumber) async {
    loading(true);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          EasyLoading.dismiss();
          EasyLoading.showError(e.message ?? "Something went wrong. Try Again",
              maskType: EasyLoadingMaskType.black);
        },
        codeSent: (verificationId, [resendToken]) {
          this.verificationId = verificationId;
          EasyLoading.dismiss();
          Get.to(
            () => CodeVerification(
              redirectFrom: 'signIn',
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          EasyLoading.dismiss();
          // EasyLoading.showError('Timeout. Try again',
          //     maskType: EasyLoadingMaskType.black);
        },
        timeout: const Duration(seconds: 30),
      );
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString(),
          maskType: EasyLoadingMaskType.black,
          duration: const Duration(seconds: 3));
    } finally {}
  }

  signIn(String smsCode) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance.authStateChanges().listen((event) async {
      final a = await event?.getIdToken();
      print('**************************** $a');
    });
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((UserCredential result) {
      // result.additionalUserInfo.
      Get.offAll(() => Home(
            hasSearchBar: appController.hasSearchIcon.isFalse,
          ));
    }).catchError((e) {
      Fluttertoast.showToast(msg: e);
    });
  }
}
