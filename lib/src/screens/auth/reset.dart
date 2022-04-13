import 'package:flutter/material.dart';

import 'inputController.dart';

class Reset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset"),
      ),
      body: ListView(
        children: [ Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Image.asset(
                "images/reset.jpg",
                width: 200.0,
              ),
              Text(
                "Reset Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "Please enter your email address. you will receive a link to create a new password via email",
                style: TextStyle(fontSize: 18.0, color: Colors.grey, height: 1.5),
              ),
              SizedBox(height: 20.0,),
              UserInputController(
                hintText: "Email Address",
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 15.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    ]
      ),
    );
  }
}
