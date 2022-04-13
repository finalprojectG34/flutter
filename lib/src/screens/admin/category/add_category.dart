import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sms/src/app.dart';

import 'package:sms/src/utils/loger/console_loger.dart';

class AddCategory extends StatefulWidget {
  static const pathName = '/add_category';
  // final ItemArgument args;
  // const AddEditProduct({this.args});
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _category = {};

  final picker = ImagePicker();
  File _image1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          children: [
            //=====================  Create product ====================================
            //            Image Selector
            Row(
              children: [
                imageDisplay(_image1, 1),
                // imageDisplay(_image2, 2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),

              //=============== Name Form ===============
              child: TextFormField(
                // initialValue: widget.args.edit ? widget.args.item.name : '',
                controller: TextEditingController(),
                decoration: InputDecoration(hintText: 'Category name'),
                validator: (value) => _nameValidator(value),
                onSaved: (value) {
                  this._category["name"] = value;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),

              //=============== Description Form ===============
              child: TextFormField(
                // initialValue: widget.args.edit ? widget.args.item.name : '',
                controller: TextEditingController(),
                decoration: InputDecoration(hintText: 'Category description'),
                validator: (value) => _nameValidator(value),
                onSaved: (value) {
                  this._category["description"] = value;
                },
              ),
            ),

            // ================ Save Button ================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (!form.validate()) {
                    form.save();
                    // logTrace("save pressed", widget.args.edit);
                    var category = Category(
                      name: this._category["name"],
                      image: _image1.path,
                      description: this._category["description"],
                    );

                    final CategoryEvent event = CategoryCreate(category);

                    BlocProvider.of<CategoryBloc>(context).add(event);

                    Navigator.of(context).pushNamed(
                      CategoryList.pathName,
                    );
                  }
                },
                label: Text('SAVE'),
                icon: Icon(Icons.save),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget imageDisplay(File image, int no) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        padding: EdgeInsets.all(3),
        child: OutlineButton(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
          onPressed: () {
            //TODO make bottom modal
            _selectImage(no);
          },
          child: _displayChild(image),
        ),
      ),
    );
  }

  Future _selectImage(int imageNumber) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      switch (imageNumber) {
        case 1:
          setState(() => _image1 = File(pickedFile.path));
          logTrace(pickedFile.path);
          break;
        // case 2:
        //   setState(() => _image2 = File(pickedFile.path));
        //   break;
      }
    }
  }

  Widget _displayChild(File image) {
    if (image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        image,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  String _nameValidator(String value) {
    if (value.isEmpty) {
      return 'You must enter the product name';
    } else if (value.length < 10) {
      return 'Product name cant have less than 10 letters';
    }
    return "";
  }
}
