// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sms/src/bloc/bloc.dart';
// import 'package:sms/src/models/models.dart';
// import 'package:sms/src/utils/loger/console_loger.dart';
//
// class UpdateProfile extends StatelessWidget {
//   static const String pathName = '/update_profile';
//   final _formKey = GlobalKey<FormState>();
//   final User user;
//
//   UpdateProfile({@required this.user});
//
//   final Map<String, dynamic> _user = {};
//
//   @override
//   Widget build(BuildContext context) {
//     logTrace("here", this.user);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Update Profile"),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(bottom: 30),
//                 child: TextFormField(
//                   controller: TextEditingController(text: user.name),
//                   onSaved: (value) {
//                     this._user["username"] = value;
//                   },
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Full Name',
//                     contentPadding: EdgeInsets.only(bottom: 0),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 30),
//                 child: TextFormField(
//                   controller: TextEditingController(text: user.email),
//                   onSaved: (value) {
//                     this._user["email"] = value;
//                   },
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     contentPadding: EdgeInsets.only(bottom: 0),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 30),
//                 child: TextFormField(
//                   controller: TextEditingController(text: user.phone),
//                   onSaved: (value) {
//                     this._user["phone"] = value;
//                   },
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Phone number',
//                     contentPadding: EdgeInsets.only(bottom: 0),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 40),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                   onTap: () => Navigator.pushNamed(context, "/add_address"),
//                   decoration: InputDecoration(
//                     labelText: 'Address',
//                     contentPadding: EdgeInsets.only(bottom: 0),
//                   ),
//                 ),
//               ),
//               RaisedButton(
//                 color: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(60),
//                 ),
//                 padding: EdgeInsets.only(top: 20, bottom: 20),
//                 onPressed: () {
//                   final form = _formKey.currentState;
//                   // if (!form.validate()) {
//                   form.save();
//
//                   // logTrace("save pressed", widget.args.edit);
//                   var user = User(
//                     id: this.user.id,
//                     name: this._user["username"],
//                     password: this.user.password,
//                     email: this._user["email"],
//                     phone: this._user["phone"],
//                   );
//
//                   logTrace("key", user);
//
//                   final UserEvent event = UserUpdate(user);
//
//                   BlocProvider.of<UserBloc>(context).add(event);
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   "Update",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
