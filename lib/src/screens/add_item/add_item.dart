import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'add_item_ctx.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String? name;
  String? description;
  double? price;

  String addItem = '''
      mutation AddItem(\$createItemInput2: ItemCreateInput!){
        createItem(input: createItemInput2){
          name
          id
        }
      }
      ''';
  var variable = {
    "createItemInput": {
      "name": "item 5",
      "description": {"description": "desc"},
      "image":
          "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg",
      "categoryId": "cat id 5"
    }
  };
  final List<String> categoryTypes = [
    'Income',
    'Expense',
    'Both',
  ];
  TextEditingController categoryTextEditingController = TextEditingController(
      text:
          'vbfdjbvjhbvjdfhbvjhdfvjbvdjfbvjdfbvjdfbvj dfhvjhbdvjbdfhbvdjfbvjdf vdfh vjhbvdjbh');
  final _formKey = GlobalKey<FormState>();
  AddItemController addItemController = Get.find();

  File? _image;

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    Get.delete<AddItemController>();
    super.dispose();
  }

  Future<void> _openImagePicker(String type) async {
    final XFile? pickedImage = await _picker.pickImage(
        source: type == 'camera' ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // AddItemController addItemController = Get.put(AddItemController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Item'),
        ),
        body: GetX<AddItemController>(
          builder: (ctx) {
            return ctx.isCategoryFetchedFromDB.isFalse
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: TextField(
                                // style: Text,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    // color: Colors.blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.75,
                                      // color: Colors.blue,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.75,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              minLines: 1,
                              maxLines: 10,
                              readOnly: true,
                              controller: TextEditingController(
                                  text: ctx.selectedCategoryName.isEmpty
                                      ? ''
                                      : ctx.selectedCategoryName.join(' / ')),
                              onTap: () {
                                addItemController.getMockCategory();
                                Navigator.pushNamed(
                                    context, "/select_category");
                                addItemController.categorySelectPages++;
                              },
                              decoration: InputDecoration(
                                labelText: 'Select Category',
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  // color: Colors.blue,
                                ),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 30,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.75,
                                    // color: Colors.blue,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.75,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   itemBuilder: (context, index) => Row(
                            //     children: [
                            //       Text(
                            //         ctx.attributes[index]['name'],
                            //         style: TextStyle(fontSize: 18),
                            //       ),
                            //       DropdownButtonFormField2(
                            //         value: 'widget.addCategoryModel.categoryType',
                            //         decoration: InputDecoration(
                            //           enabledBorder: const OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //                 color: Colors.green, width: 0.5),
                            //           ),
                            //           focusedBorder: const OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //                 color: Colors.green, width: 0.75),
                            //           ),
                            //           contentPadding: EdgeInsets.zero,
                            //           border: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(5),
                            //           ),
                            //         ),
                            //         isExpanded: true,
                            //         hint: Text(
                            //           'Select ${ctx.attributes[index]['name']}',
                            //           style: TextStyle(
                            //               fontSize: 14, color: Colors.green),
                            //         ),
                            //         icon: const Icon(
                            //           Icons.arrow_drop_down,
                            //           color: Colors.green,
                            //         ),
                            //         iconSize: 25,
                            //         buttonPadding: const EdgeInsets.only(
                            //             left: 20, right: 10),
                            //         dropdownDecoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         items: ctx.attributes[index]['options']
                            //             .map(
                            //               (item) => DropdownMenuItem<String>(
                            //                 value: item,
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Expanded(
                            //                       child: Text(
                            //                         item,
                            //                         style: const TextStyle(
                            //                           fontSize: 14,
                            //                         ),
                            //                         textAlign: TextAlign.center,
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             )
                            //             .toList(),
                            //         onChanged: (value) {
                            //           // addCategoryController.setCategoryType(
                            //           //     categoryId: widget.addCategoryModel.id,
                            //           //     categoryType: value);
                            //         },
                            //         onSaved: (value) {
                            //           // selectedValue = value.toString();
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            //   itemCount: ctx.attributes.length,
                            // ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Price',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    // color: Colors.blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.75,
                                      // color: Colors.blue,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.75,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: TextField(
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    // color: Colors.blue,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.75,
                                      // color: Colors.blue,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.75,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            _image != null
                                ? Center(
                                    child: Stack(
                                      alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          child: ClipRRect(
                                            child: Image.file(_image!,
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print('yy');
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red.shade300,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                            OutlinedButton(
                              child: Text('Add image'),
                              onPressed: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) => SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            onTap: () {
                                              _openImagePicker('camera');
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(30),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Add from camera',
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Icon(
                                                      Icons.add_a_photo,
                                                      size: 30,
                                                    )
                                                  ],
                                                )),
                                          ),
                                          InkWell(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            onTap: () {
                                              _openImagePicker('gallery');
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(30),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text('Add from gallery'),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Icon(
                                                      Icons.camera,
                                                      size: 30,
                                                    )
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                      }
                                      addItemController.addItem(variable);
                                    },
                                    child: const Text('Save'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class HomePagee extends StatefulWidget {
  const HomePagee({Key? key}) : super(key: key);

  @override
  _HomePageStatee createState() => _HomePageStatee();
}

class _HomePageStatee extends State<HomePagee> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  child: const Text('Select An Image'),
                  onPressed: _openImagePicker,
                ),
              ),
              const SizedBox(height: 35),
              _image != null
                  ? Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        SizedBox(
                          height: 200,
                          child: ClipRRect(
                            child: Image.file(_image!, fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  : const Text('Please select an image')
            ],
          ),
        ),
      ),
    );
  }
}
