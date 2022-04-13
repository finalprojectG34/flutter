import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/bloc/signup/SignupBloc.dart';
import 'package:sms/src/bloc/signup/signup_event.dart';
import 'package:sms/src/bloc/signup/signup_state.dart';

import '../../app.dart';
import 'inputController.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureItem = false;
  GlobalKey<FormState>_formState=GlobalKey<FormState>();
  String name;
  String email;
  String password;
  String passwordAgain;

  void _toggleItem() {
    setState(() {
      _obscureItem = !_obscureItem;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: BlocConsumer<SignupBloc,SignupState>(
        listener: (context,state){
          if(state is SignupFailure){
            Scaffold.of(context).showSnackBar(SnackBar(
              content:Text("Signup Fail"),
            ));
          }
          if(state is SignupSuccessful){
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          if(state is SignupLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          return Form(
              key: _formState,
              child:Padding(
                padding: const EdgeInsets.all(40.0),
                child: ListView(
                  children: [
                    Center(
                        child: Text(
                          "Create new account",
                          style: TextStyle(fontSize: 20.0, color: Colors.grey),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(

                      onTap: _toggleItem,
                      onSaved: (value){
                        name=value;
                      },
                      validator: (value){
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "full Name",
                        hintStyle: TextStyle(fontSize: 14.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          size: 28.0,
                        ),
                      ),
                    ),
                    // UserInputController(
                    //   hintText: "full Name",
                    //   icon: Icons.account_circle,
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(

                      onTap: _toggleItem,
                      onSaved: (value){
                        email=value;
                      },
                      validator: (value){
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        hintStyle: TextStyle(fontSize: 14.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 28.0,
                        ),
                      ),
                    ),
                    // UserInputController(
                    //   hintText: "Email Address",
                    //   icon: Icons.email_outlined,
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText:  true,
                      onTap: _toggleItem,
                      onSaved: (value){
                        password=value;
                      },
                      validator: (value){
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 14.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline_sharp,
                          size: 28.0,
                        ),
                      ),
                    ),
                    // UserInputController(
                    //   hintText: "Password",
                    //   icon: Icons.lock_outline_sharp,
                    //   onElementTap: _toggleItem,
                    //   obscureElement: _obscureItem,
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText:  true,
                      onTap: _toggleItem,
                      onSaved: (value){
                        password=value;
                      },
                      validator: (value){
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password Again",
                        hintStyle: TextStyle(fontSize: 14.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline_sharp,
                          size: 28.0,
                        ),
                      ),
                    ),
                    // UserInputController(
                    //   hintText: "Password Again",
                    //   icon: Icons.lock_outline_sharp,
                    //   onElementTap: _toggleItem,
                    //   obscureElement: _obscureItem,
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      onPressed: () {
                        if(_formState.currentState.validate()){
                          _formState.currentState.save();
                          context.read<SignupBloc>().add(SignupSubmitted(user: User(name: name,email: email,password: password)));
                        }

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "have a account?",
                          style: TextStyle(color: Colors.grey, fontSize: 17.0),
                        ),
                        FlatButton(
                          onPressed: () {Navigator.pop(context);},
                          highlightColor: Colors.white,
                          splashColor: Colors.white,
                          focusColor: Colors.white,
                          color: Colors.white,
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.blue[700], fontSize: 17.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        },

      ),
    );
  }
}
