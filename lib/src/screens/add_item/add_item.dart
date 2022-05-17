import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  final _formKey = GlobalKey<FormState>();
  AddItemController addItemController = Get.find();

  @override
  void dispose() {
    Get.delete<AddItemController>();
    super.dispose();
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
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    // style: Text,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.75,
                          color: Colors.blue,
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
                GetX<AddItemController>(
                  builder: (ctx) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: DropdownButtonFormField2(
                        // value: widget.addCategoryModel.categoryType,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 0.75),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 0.75),
                          ),
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'Select category Type',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blue,
                        ),
                        iconSize: 25,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        items: addItemController.categoryList?.length == 0
                            ? ['1']
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: const Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                )
                                .toList()
                            : addItemController.categoryList
                                ?.map((category) => DropdownMenuItem<String>(
                                      value: category.name,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              category.name!,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                        onChanged: (value) {
                          // addCategoryController.setCategoryType(
                          //     categoryId: widget.addCategoryModel.id,
                          //     categoryType: value);
                        },
                        onSaved: (value) {
                          // selectedValue = value.toString();
                        },
                      ),
                    );
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.75,
                          color: Colors.blue,
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
                TextButton(
                  child: Text('Add image'),
                  onPressed: () {},
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
      ),
    );
  }
}
