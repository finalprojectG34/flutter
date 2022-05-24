import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/auth/signup/signupCtx.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.find();

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;

  var variable = {
    "createItemInput": {
      "name": "item 5",
      "description": {"description": "desc"},
      "image":
      "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg",
      "categoryId": "cat id 5"
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SignUpController>(builder: (ctx) {
        return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: ctx.isUserCreatedSuccessfully.isTrue
                    ? [
                  Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Continue'))
                ]
                    : [
                  const Padding(padding: EdgeInsets.only(top: 100)),
                  // Center(
                  //   child: Image.asset("images/home_icon.png"),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Create new account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Text(
                  //   "Sign in to continue",
                  //   style: TextStyle(),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "First Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Colors.grey[200]!, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Colors.grey[200]!, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Colors.grey[200]!, width: 1)),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) => firstName = text,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Last Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Colors.grey[200]!, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Colors.grey[200]!, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: Colors.grey[200]!, width: 1)),
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) => lastName = text,
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Your Phone",
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
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    onChanged: (text) => phoneNumber = text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Password",
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
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (text) => password = text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Confirm Password",
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
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        shadowColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                        elevation: MaterialStateProperty.all(6),
                        backgroundColor: MaterialStateProperty.all(
                            const Color(0xff40BFFF)),
                        fixedSize:
                        MaterialStateProperty.all(Size(Get.width, 54)),
                      ),
                      onPressed: () {
                        ctx.sendOtp({
                          "token": {
                            "firstName": firstName,
                            "lastName": lastName,
                            "phone": "+251" + phoneNumber!,
                            "password": "dewiuyiueryf",
                            "confirmPassword": "dewiuyiueryf",
                            "idToken": ''
                          }
                        });
                        // signUpController.signupUser({
                        //   "input": {
                        //     "firstName": firstName,
                        //     "lastName": lastName,
                        //     "phone": phoneNumber,
                        //     // "password": "my password"
                        //   }
                        // });
                      },
                      child: ctx.isLoading.isTrue
                          ? CircularProgressIndicator()
                          : const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      )),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            // Get.off(() => Login());
                            Get.back();
                          },
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
                  )
                ],
              ),
            ));
      }),
    );
  }
}
