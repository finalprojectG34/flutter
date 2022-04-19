import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms/src/models/user.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

class ChangePassword extends StatelessWidget {
  static const String pathName = '/change_password';
  final _formKey = GlobalKey<FormState>();

  final User? user;

  ChangePassword({@required this.user});

  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    logTrace("here", this.user);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        controller: TextEditingController(),
                        onSaved: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Old Password',
                          contentPadding: EdgeInsets.only(bottom: 0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        controller: TextEditingController(),
                        onSaved: (value) {
                          this._user["password"] = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          contentPadding: EdgeInsets.only(bottom: 0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        controller: TextEditingController(),
                        onSaved: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          contentPadding: EdgeInsets.only(bottom: 0),
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(20),
                      onPressed: () {
                        // if (_formKey.currentState.validate()) {
                        //   Scaffold.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text('Processing Data'),
                        //     ),
                        //   );
                        // }

                        final form = _formKey.currentState;
                        // if (!form.validate()) {
                        form?.save();

                        // logTrace("save pressed", widget.args.edit);
                        var userUpdate = User(
                          id: this.user?.id,
                          name: this.user?.name,
                          password: this._user["password"],
                          email: this.user?.email,
                          phone: this.user?.phone,
                        );

                        logTrace("key", userUpdate);

                        // final UserEvent event = UserUpdate(userUpdate);
                        //
                        // BlocProvider.of<UserBloc>(context).add(event);
                        // Navigator.of(context).pop();
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
