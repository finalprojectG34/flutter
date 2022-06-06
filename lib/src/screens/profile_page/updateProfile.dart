import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/models/models.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

import '../../packages/validators.dart';

class UpdateProfile extends StatelessWidget {
  static const String pathName = '/update_profile';

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  // final User user;
  String? firstName;
  String? lastName;
  String? phoneNumber;

  // UpdateProfile();

  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    logTrace("here");
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formState,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "First Name",
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
                keyboardType: TextInputType.text,
                onChanged: (text) => firstName = text,
                // validator: validateName,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Last Name",
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
                keyboardType: TextInputType.text,
                onChanged: (text) => lastName = text,
                // validator: validateName,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Phone number",
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
                validator: validateMobileNum,
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 30),
              //   child: TextFormField(
              //     controller: TextEditingController(text: 'user.name'),
              //     onSaved: (value) {
              //       this._user["username"] = value;
              //     },
              //     // validator: (value) {
              //     //   if (value.isEmpty) {
              //     //     return 'Please enter some text';
              //     //   }
              //     //   return null;
              //     // },
              //     decoration: InputDecoration(
              //       labelText: 'Full Name',
              //       contentPadding: EdgeInsets.only(bottom: 0),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 30),
              //   child: TextFormField(
              //     controller: TextEditingController(text: 'user.email'),
              //     onSaved: (value) {
              //       this._user["email"] = value;
              //     },
              //     // validator: (value) {
              //     //   if (value.isEmpty) {
              //     //     return 'Please enter some text';
              //     //   }
              //     //   return null;
              //     // },
              //     decoration: InputDecoration(
              //       labelText: 'Email',
              //       contentPadding: EdgeInsets.only(bottom: 0),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 30),
              //   child: TextFormField(
              //     controller: TextEditingController(text: 'user.phone'),
              //     onSaved: (value) {
              //       this._user["phone"] = value;
              //     },
              //     // validator: (value) {
              //     //   if (value.isEmpty) {
              //     //     return 'Please enter some text';
              //     //   }
              //     //   return null;
              //     // },
              //     decoration: InputDecoration(
              //       labelText: 'Phone number',
              //       contentPadding: EdgeInsets.only(bottom: 0),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 40),
              //   child: TextFormField(
              //     // validator: (value) {
              //     //   if (value.isEmpty) {
              //     //     return 'Please enter some text';
              //     //   }
              //     //   return null;
              //     // },
              //     onTap: () => Navigator.pushNamed(context, "/add_address"),
              //     decoration: InputDecoration(
              //       labelText: 'Address',
              //       contentPadding: EdgeInsets.only(bottom: 0),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                style: ButtonStyle(
                  shadowColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent),
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff40BFFF)),
                  fixedSize: MaterialStateProperty.all(Size(Get.width, 54)),
                ),
                onPressed: () {
                  if (formState.currentState!.validate()) {}
                },
                child: const Text(
                  "Update",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
