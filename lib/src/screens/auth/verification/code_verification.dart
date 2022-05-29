import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/screens/auth/signup/signupCtx.dart';

import '../login/loginCtx.dart';

class CodeVerification extends StatelessWidget {
  CodeVerification({Key? key, required this.redirectFrom, this.variable})
      : super(key: key);
  final txtController = TextEditingController();
  final formState = GlobalKey<FormState>();
  final String redirectFrom;
  LoginController? loginController;
  SignUpController? signUpController;
  var variable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: formState,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  // Center(
                  //   child: Image.asset("images/home_icon.png"),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Code Verification",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      // prefixIcon: const Icon(Icons.verified_outlined,color: Colors.grey,),
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Enter Code",

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.grey[200]!, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.grey[200]!, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: Colors.grey[200]!, width: 1)),
                    ),
                    controller: txtController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent),
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff40BFFF)),
                      fixedSize:
                          MaterialStateProperty.all(Size(Get.width * 0.45, 54)),
                    ),
                    onPressed: () async {
                      redirectFrom == 'signIn'
                          ? loginController = Get.find<LoginController>()
                          : signUpController = Get.find<SignUpController>();

                      redirectFrom == 'signIn'
                          ? await loginController
                              ?.signIn(txtController.text.toString())
                          : await signUpController?.signUp(
                              txtController.text.toString(), variable);
                      // ctx.signIn(txtController.text.toString());

                      // Get.offAll(() => App());
                      // Na
                      // Navigator.of(context)
                      //     .pushNamedAndRemoveUntil('/',ModalRoute.withName("/"));
                      // if(signUpController!.isUserCreatedSuccessfully.isTrue){
                      //   Fluttertoast.showToast(
                      //       msg: 'Account successfully created');
                      // }
                      // AppController appCtx = Get.find();
                      // appCtx.selectedIndex(0);
                      // Get.offNamedUntil("/", ModalRoute.withName("/"));
                    },
                    child: GetX<SignUpController>(builder: (ctx) {
                      return ctx.isVerificationLoading.isTrue
                          ? CircularProgressIndicator()
                          : ctx.isUserCreatedSuccessfully.isTrue
                              ? Icon(Icons.check)
                              : const Text(
                                  "Verify Code",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                );
                    }),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Expanded(
                              child: Center(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  color: Color(0xff40BFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Expanded(
                              child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Color(0xff40BFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ))),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
