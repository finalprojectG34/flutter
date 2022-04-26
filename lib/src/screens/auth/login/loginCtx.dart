import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sms/src/app.dart';

import '../../home_page/AppCtx.dart';
import '../verification/code_verification.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  var error = false.obs;
  String verificationId = "";
  final AppController appController = Get.find();

  sendOtp(String phoneNumber) async {
    loading(true);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(
              msg: e.message ?? "Something went wrong. Try Again");
          loading(false);
        },
        codeSent: (verificationId, [resendToken]) {
          this.verificationId = verificationId;
          Get.to(() => CodeVerification());
          loading(false);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 100),
      );
    } catch (e) {
      error(true);
    } finally {}
  }

  signIn(String smsCode) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((UserCredential result) {
      Get.offAll(() => Home(
            hasSearchBar: appController.hasSearchIcon.isFalse,
          ));
    }).catchError((e) {
      Fluttertoast.showToast(msg: e);
    });
  }
}
