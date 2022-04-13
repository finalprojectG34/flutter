import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms/src/app.dart';

class EditCategory extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();

  static const pathName = '/category_edit';

  final Category category;

  EditCategory({@required this.category});

  final Map<String, dynamic> _category = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit category")),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => {},
                ),
                Text(
                  "Edit category ${this.category.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //=====================  Update product ====================================

                    Padding(
                      padding: const EdgeInsets.all(12.0),

                      //=============== Name Form ===============
                      child: TextFormField(
                        // initialValue: "this.category.name",
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
                        // initialValue: category.description,
                        controller: TextEditingController(),
                        decoration:
                            InputDecoration(hintText: 'Category description'),
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
                          // if (!form.validate()) {
                          form.save();
                          // logTrace("save pressed", widget.args.edit);
                          var category = Category(
                            id: this.category.id,
                            name: this._category["name"],
                            // image: _image1.path,
                            description: this._category["description"],
                          );

                          final CategoryEvent event = CategoryUpdate(category);

                          BlocProvider.of<CategoryBloc>(context).add(event);
                          Navigator.of(context).pushNamed(
                            CategoryList.pathName,
                          );

                          // }
                        },
                        label: Text('UDATE'),
                        icon: Icon(Icons.save),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _nameValidator(String value) {
    if (value.isEmpty) {
      return 'You must enter the product name';
    } else if (value.length < 1) {
      return 'Product name cant have less than 1 letters';
    }
    return "";
  }
}
