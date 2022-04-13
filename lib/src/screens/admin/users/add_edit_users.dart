import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sms/src/app.dart';

import 'package:sms/src/utils/loger/console_loger.dart';

class AddEditUsers extends StatefulWidget {
  static const routeName = '/itemAddEdit';
  final PageArgument args;
  AddEditUsers({this.args});

  @override
  _AddEditUsersState createState() => _AddEditUsersState();
}

class _AddEditUsersState extends State<AddEditUsers> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    _fillRoles();
    if(widget.args.item!=null){
      _currentRole=widget.args.item.role;
    }else{
      _currentRole="USER";
    }

    super.initState();
  }
  final Map<String, dynamic> _formData = {
    'name': '',
    'phone': '',
    'email': "",
    "password":"",
  };

  final picker = ImagePicker();
  File _image1;

  var Roles =['USER', 'ADMIN',];
  List<DropdownMenuItem<String>> categoriesDropDown = <DropdownMenuItem<String>>[];

  void _fillRoles(){
    categoriesDropDown=Roles.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );

    }).toList();
  }

  String _currentRole ;


//  =============================   Build Fields  ====================
  void _onUserSaved(String value) {
    _formData["name"] = value;
  }
  void _onPhoneSaved(String value) {
    _formData["phone"] = value;
  }
  void _saveEmail(String desc){
    _formData['email'] = desc;
    // logTrace("desc form data", desc);
  }
  void _savePassword(String desc){
    _formData['[password]'] = desc;
    // logTrace("desc form data", desc);
  }


  @override
  Widget build(BuildContext context) {
    var item = widget.args.item;
    var id;
    if (item == null) {
      id = "";
    } else {
      id = item.id;
    }
    var name;

    return Scaffold(
      appBar: _buildAppBar(context),

      body: BlocConsumer<UserBloc, UserState>(
          listener: (context, itemState) {
            if (itemState is UserOperationFailure) {

              Scaffold.of(context).showSnackBar(SnackBar(content: Text("add error")));
            }
            if (itemState is UsersLoadSuccess) {

              Scaffold.of(context).showSnackBar( SnackBar(content: Text("User created successfully")));
            }
          }, builder: (context, userState) {
        if (userState is UserLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
                children: [
                  //=====================  Create product ====================================
                  //  ===================---------          Image Selector

                  formName(item, _nameController, _onUserSaved,  "enter name", _nameValidator,),
                  formPhone(item, _phoneTextController, _onPhoneSaved, "phone number"),
                  formEmail(item, _emailTextController, _saveEmail, "email"),

                  if (!widget.args.edit)
                    formPassword(item, _passwordTextController, _savePassword, "password"),


                  //================ Category Drop Down ===============
                  Container(
                  padding: EdgeInsets.all(8),
                  child: DropdownButton(
                  items:categoriesDropDown,

                  onChanged: changeSelectedCategory,
                  value: _currentRole,
                  ),
                  ),

                  // ================ Save Button ================
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton.icon(
                      onPressed: () {

                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          // logTrace("save pressed", widget.args.edit);
                          var item = User(
                            id: id,
                            name: this._formData["name"],
                            phone: this._formData["phone"],
                            email: this._formData["email"],
                            password: this._formData["password"],
                              role:this._formData[""]
                          );

                          final UserEvent event = widget.args.edit
                              ? UserUpdate(item)
                              : UserCreate(item);

                          // logTrace("00000",itemState);
                          BlocProvider.of<UserBloc>(context).add(event);
                          // logTrace("00000", itemState);

                          // Navigator.of(context).pushNamed(
                          //   UsersList.routeName,
                          // );

                          if (userState is UsersLoadSuccess) {
                            // Scaffold.of(context).showSnackBar(SnackBar(content: Text("add error")));
                            form.reset();
                          }
                        }
                      },
                      label: Text('SAVE'),
                      icon: Icon(Icons.save),
                    ),
                  ),
                ],
              )),
        );
      }),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => {Navigator.pop(context)},
      ),
      title: Text(widget.args.edit ? 'Edit user' : 'Add New user'),
    );
  }

  Container _category_dropdown() {
    return Container(
      padding: EdgeInsets.all(8),
      child: DropdownButton(
        items:categoriesDropDown,

        onChanged: changeSelectedCategory,
        value: _currentRole,
      ),
    );
  }

  void changeSelectedCategory(String selectedCategory) {
    setState(() => _currentRole = selectedCategory);
  }



  Padding _displayImage(File image) {
    if (image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.file(
          image,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      );
    }
  }

  String _nameValidator(String value) {
    if (value.isEmpty) {
      return 'this field cant be empty';
    } else if (value.length < 5) {
      return ' 5 letters is minimum';
    }
    return null;
  }
}
