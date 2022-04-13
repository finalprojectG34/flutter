import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/bloc/Auth/auth_bloc.dart';
import 'package:sms/src/bloc/Login/login_bloc.dart';
import 'package:sms/src/bloc/signup/SignupBloc.dart';

import 'reset.dart';
import 'signup.dart';

import 'inputController.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureElement = false;
  String username="";
  String password="";
  GlobalKey<FormState> _formState=GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureElement = !_obscureElement;
    });

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc,LoginState>(
        listener: (context,loginState){
          if(loginState is LoginFailure){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Login error")));
          }
        },

        builder: (context,loginState){
          if(loginState is LoginLoading){
            return Center(child:CircularProgressIndicator());
          }
          return Scaffold(
            // appBar: AppBar(
            //   title: Text("Project"),
            // ),
              body: Form(
                key: _formState,
                child:Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Welcome ",
                          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Center(
                        child: Text(
                          "Sign in to continue",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        // obscureText: this._obscureElement == null ? false : this._obscureElement,
                        onTap: _toggle,
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
                        onChanged: (value) {
                          setState(() {
                            username=value;
                          });
                        },
                        validator: (value){

                        },
                      ),
                      // UserInputController(
                      //   hintText: "Email Address",
                      //   icon: Icons.email_outlined,
                      // ),
                      SizedBox(
                        height: 10.0,
                      ),
                      // UserInputController(
                      //   hintText: "Password",
                      //   icon: Icons.lock_outline_sharp,
                      //   onElementTap: _toggle,
                      //   obscureElement: _obscureElement,
                      // ),
                      TextFormField(
                          obscureText: this._obscureElement == null ? false : this._obscureElement,
                          onTap: _toggle,
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
                          onChanged: (value) {
                            setState(() {
                              password=value;
                            });
                          }
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child:  FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Reset()));
                          },
                          highlightColor: Colors.white,
                          splashColor: Colors.white,
                          focusColor: Colors.white,
                          color: Colors.white,
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue[700]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0))),
                        onPressed: () {
                          if(_formState.currentState.validate()){
                            _formState.currentState.save();
                            BlocProvider.of<LoginBloc>(context).add(LoginSubmitted(authInfo: AuthInfo(info_type: "email",info: username,password: password)));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: Divider(
                                  color: Colors.grey[400],
                                  thickness: 0.7,
                                )),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Divider(
                                color: Colors.grey[400],
                                thickness: 0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       primary: Colors.white,
                      //       elevation: 0.0,
                      //       side: BorderSide(
                      //         color: Colors.black26,
                      //       ),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(25.0))),
                      //   onPressed: () {},
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(15.0),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.six_ft_apart,
                      //           color: Colors.black,
                      //         ),
                      //         Expanded(
                      //           child: Align(
                      //             child: Text(
                      //               "Sign in with Google",
                      //               style: TextStyle(color: Colors.black),
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       primary: Colors.white,
                      //       elevation: 0.0,
                      //       side: BorderSide(
                      //         color: Colors.black26,
                      //       ),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(25.0))),
                      //   onPressed: () {},
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(15.0),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.six_ft_apart,
                      //           color: Colors.black,
                      //         ),
                      //         Expanded(
                      //           child: Align(
                      //             child: Text(
                      //               "Sign in with Facebook",
                      //               style: TextStyle(color: Colors.black),
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have a account?",
                            style: TextStyle(color: Colors.grey, fontSize: 17.0),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => BlocProvider<SignupBloc>(create:(context)=>SignupBloc(authenticationRepository: context.read<AuthenticationRepository>(),authenticationBloc: context.read<AuthenticationBloc>()),child: SignUp(),)));
                            },
                            highlightColor: Colors.white,
                            splashColor: Colors.white,
                            focusColor: Colors.white,
                            color: Colors.white,
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.blue[700], fontSize: 17.0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
