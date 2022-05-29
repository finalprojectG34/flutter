import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/home_page/AppCtx.dart';

import '../../../../data/repository/user_repository.dart';
import '../../../models/user.dart' as user;
import '../verification/code_verification.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isVerificationLoading = false.obs;
  RxBool isUserCreatedSuccessfully = false.obs;
  RxBool error = false.obs;
  String verificationId = "";
  // user.User? createdUser;
  UserRepository userRepository = UserRepository();
  var userVariable;

  signupUser(variable) async {
    print(userVariable);
    isLoading(true);
    try {
      await userRepository.signupUser(userVariable);
      Fluttertoast.showToast(msg: "Account created successfully");
      AppController appController = Get.find();
      appController.changePage('Home', 0);
      Get.back();
      Get.back();
      print('yoooohooooooooooooo');
    } catch (e) {
      print('$e   the erooooooooooooooooor');
      error(true);
    }

    isLoading(false);
    // if (createdUser != null) {
    //   isUserCreatedSuccessfully(true);
    // }
    // print(createdUser.toString() + ' ############################aaaa');
    // isCategoryFetchedFromDB(true);
  }

  sendOtp(variable) async {
    userVariable = variable;
    isLoading(true);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: variable['token']['phone'],
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(
              msg: e.message ?? "Something went wrong. Try Again");
          isLoading(false);
        },
        codeSent: (verificationId, [resendToken]) {
          this.verificationId = verificationId;
          Get.to(() => CodeVerification(
                redirectFrom: 'signUp',
                variable: variable,
              ));
          isLoading(false);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 100),
      );
    } catch (e) {
      error(true);
    } finally {}
  }

  signUp(String smsCode, variable) {
    isVerificationLoading(true);
    var a;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance.authStateChanges().listen((event) async {
      a ??= await event?.getIdToken();

      print('**************************** $a');
    });
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((UserCredential result) async {
      // result.additionalUserInfo.
      // result.credential
      if (a != null) {
        // isLoading(true);
        userVariable['token']['idToken'] = a;
        userVariable['token']['phone'] = 'cdchjgvhj';
        await signupUser(userVariable);
        isVerificationLoading(false);

        // Navigator.pop
        // Get.offAll(()=> App());

        isLoading(false);
        // if (createdUser != null) {
        //   isUserCreatedSuccessfully(true);
        //   // isVerificationLoading(false);
        //   // Fluttertoast.showToast(msg: "Account created successfully");
        //   // AppController appController = Get.find();
        //   // appController.changePage('Home', 0);
        //   // Get.back();
        //   // Get.back();
        //   // print('yoooohooooooooooooo');
        //   // Fluttertoast.showToast(
        //   //     msg: "Account created successfully");
        // }
      }
      // Get.offAll(() => Home(
      //   hasSearchBar: appController.hasSearchIcon.isFalse,
      // ));
    }).catchError((e) {
      isVerificationLoading(false);
      Fluttertoast.showToast(msg: 'Invalid code or code expired');
    });
  }
}
