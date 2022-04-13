import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sms/src/bloc/item/item_bloc.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/admin/item/listItems.dart';

import 'package:sms/src/utils/loger/console_loger.dart';

class AddEditProduct extends StatefulWidget {
  static const routeName = '/itemAddEdit';
  final PageArgument args;
  AddEditProduct({this.args});

  @override
  _AddEditProductState createState() => _AddEditProductState();
}

class _AddEditProductState extends State<AddEditProduct> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  final _priceTextController = TextEditingController();

  final Map<String, dynamic> _formData = {
    'title': '',
    'description': '',
    'image': null,
    'price': null,
  };

  final picker = ImagePicker();
  File _image1;

  List<DropdownMenuItem<String>> categoriesDropDownList = <DropdownMenuItem<String>>[];
  String _currentCategory;


//  =============================   Build Fields  ====================
  void onItemSaved(String value) {
    _formData["name"] = value;
  }
  void onPriceSaved(String value) {
    _formData['price'] = double.parse(value);
  }
  void saveDesc(String desc){
    _formData['description'] = desc;
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

      body: BlocConsumer<ItemBloc, ItemState>(
          listener: (context, itemState) {
        if (itemState is ItemOperationFailure) {

          Scaffold.of(context).showSnackBar(SnackBar(content: Text("add error")));
        }
        if (itemState is ItemsLoadSuccess) {

          Scaffold.of(context).showSnackBar( SnackBar(content: Text("Item created successfully")));
        }
      }, builder: (context, itemState) {
        if (itemState is ItemLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            children: [
              //=====================  Create product ====================================
              //  ===================---------          Image Selector
              Row(
                children: [
                  imageDisplay(_image1, 1),
                  // imageDisplay(_image2, 2),
                ],
              ),

              _category_dropdown(),
              formName(item , productNameController, onItemSaved, "roles name", _nameValidator, ),
              formNumber(item, _priceTextController, onPriceSaved),
              formDescription(item, _descriptionTextController, saveDesc),
              //================ Category Drop Down ===============

              // ================ Save Button ================
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      // logTrace("save pressed", widget.args.edit);
                      var item = Item(
                        id: id,
                        name: this._formData["name"],
                        price: this._formData["price"].toString(),
                        imagePath: _image1.path,
                        description: this._formData["description"],
                      );
                      final ItemEvent event = widget.args.edit
                          ? ItemUpdate(item)
                          : ItemCreate(item);

                      // logTrace("00000",itemState);
                      BlocProvider.of<ItemBloc>(context).add(event);
                      // logTrace("00000", itemState);

                      // Navigator.of(context).pushNamed(
                      //   ItemsList.routeName,
                      // );

                      if (itemState is ItemsLoadSuccess) {
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
      title: Text(widget.args.edit ? 'Edit item' : 'Add New item'),
    );
  }

  Container _category_dropdown() {
    return Container(
      padding: EdgeInsets.all(8),
      child: DropdownButton(
        items: categoriesDropDownList,
        onChanged: changeSelectedCategory,
        value: _currentCategory,
      ),
    );
  }

  void changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  Expanded imageDisplay(File image, int no) {
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
          child: _displayImage(image),
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
      return 'You must enter the product name';
    } else if (value.length < 5) {
      return 'Product name cant have less than 5 letters';
    }
    return null;
  }
}
