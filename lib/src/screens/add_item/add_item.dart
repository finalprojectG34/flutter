import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sms/src/screens/add_item/category_list.dart';
import 'package:sms/src/screens/add_item/text_attribute.dart';
import 'package:sms/src/screens/home_page/AppCtx.dart';

import '../components/add_shop.dart';
import 'add_item_ctx.dart';
import 'dropdown_attributes.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key, required this.hasAppbar}) : super(key: key);
  final bool hasAppbar;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String? name;
  String? description;
  double? price;
  double? discountPrice;

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
AppController appController = Get.find();

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
  void initState() {
    super.initState();
    addItemController.getMe();
  }

  @override
  Widget build(BuildContext context) {
    // AddItemController addItemController = Get.put(AddItemController());
    return GetX<AddItemController>(
      builder: (ctx) {
        return Scaffold(
          appBar: widget.hasAppbar
              ? AppBar(
                  title: Text(
                      '${ctx.userHasShop!.isTrue ? 'Add Item' : 'Register your shop'}'),
                )
              : null,
          body: ctx.isShopLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : ctx.errOccurred.isTrue
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(ctx.err.value),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  ctx.getUserShop();
                                },
                                child: Text('Retry'))
                          ],
                        ),
                      ),
                    )
                  : ctx.userHasShop!.isTrue
                      ? ctx.isCategoryFetchedFromDB.isTrue &&
                              ctx.categoryList!.isEmpty
                          ? const Center(
                              child: Text('No category found!'),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: ListView(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        // style: Text,
                                        onChanged: (text) => name = text,
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
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextField(
                                        minLines: 1,
                                        maxLines: 10,
                                        readOnly: true,
                                        controller: TextEditingController(
                                            text:
                                                ctx.selectedCategoryName.isEmpty
                                                    ? ''
                                                    : ctx.selectedCategoryName
                                                        .join(' / ')),
                                        onTap: () {
                                          Get.to(() => CategoryListPage());
                                          // addItemController.getMockCategory();
                                          // Navigator.pushNamed(
                                          //     context, "/select_category");
                                          addItemController
                                              .categorySelectPages++;
                                        },
                                        decoration: const InputDecoration(
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
                                        height: 15,
                                      ),
                                      if (ctx.categoryDetail.value.id != null)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) =>
                                                  ctx
                                                              .categoryDetail
                                                              .value
                                                              .attributes![
                                                                  index]
                                                              .display ==
                                                          'dropdown'
                                                      ? DropdownAttr(
                                                          attribute: ctx
                                                                  .categoryDetail
                                                                  .value
                                                                  .attributes![
                                                              index],
                                                        )
                                                      : TextAttribute(
                                                          attribute: ctx
                                                                  .categoryDetail
                                                                  .value
                                                                  .attributes![
                                                              index]),
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                        height: 10,
                                                      ),
                                              itemCount: ctx.categoryDetail
                                                  .value.attributes!.length),
                                        ),
                                      if (ctx.categoryDetail.value.id != null)
                                        SizedBox(
                                          height: 10,
                                        ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (text) =>
                                            price = double.tryParse(text),
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
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (text) => discountPrice =
                                            double.tryParse(text),
                                        decoration: InputDecoration(
                                          labelText:
                                              'Discounted Price (Optional)',

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
                                          // contentPadding: EdgeInsets.zero
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextField(
                                        maxLines: 5,
                                        minLines: 1,
                                        onChanged: (text) => description = text,
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      _image != null
                                          ? Center(
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.topEnd,
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                    child: ClipRRect(
                                                      child: Image.file(_image!,
                                                          fit: BoxFit.cover),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      print('yy');

                                                      setState(() {
                                                        _image = null;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.delete,
                                                      color:
                                                          Colors.red.shade300,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: TextButton(
                                          child: Text('Add image'),
                                          onPressed: () {
                                            showModalBottomSheet(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),
                                              context: context,
                                              builder: (context) => SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                        onTap: () {
                                                          _openImagePicker(
                                                              'camera');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  'Add from camera',
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .add_a_photo,
                                                                  size: 30,
                                                                )
                                                              ],
                                                            )),
                                                      ),
                                                      InkWell(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                        onTap: () {
                                                          _openImagePicker(
                                                              'gallery');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10))),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                  'Add from gallery'),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Icon(
                                                                Icons.camera,
                                                                size: 30,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                // if (_formKey.currentState!.validate()) {
                                                //   _formKey.currentState!.save();
                                                // }
                                                FocusScope.of(context)
                                                    .unfocus();
                                                EasyLoading
                                                        .instance.loadingStyle =
                                                    EasyLoadingStyle.light;
                                                await EasyLoading.show(
                                                  status: 'Please wait',
                                                  maskType:
                                                      EasyLoadingMaskType.black,
                                                );
                                                if (_image != null) {
                                                  addItemController.addItem({
                                                    "name": name,
                                                    "ctgId": ctx
                                                        .selectedCategoryId
                                                        .value
                                                        .last,
                                                    "description": description,
                                                    "image": {"imageCover": ''},
                                                    "price": {
                                                      "discountPrice":
                                                          discountPrice,
                                                      "sale": price
                                                    },
                                                    "attributes": []
                                                  }, _image!);
                                                }
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
                            )
                      : AddShop(
                          redirectFrom: 'home',
                        ),
        );
      },
    );
  }
}
