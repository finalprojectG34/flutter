import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AddShop extends StatefulWidget {
  const AddShop({Key? key}) : super(key: key);

  @override
  State<AddShop> createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  String shopName = '';
  String description = '';
  String area = '';
  String location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register as a seller')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.shop_outlined),
                contentPadding: const EdgeInsets.all(10),
                hintText: "Shop Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey[200]!, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey[200]!, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey[200]!, width: 1)),
              ),
              maxLines: 1,
              keyboardType: TextInputType.text,
              onChanged: (text) => shopName = text,
              // validator: validateName,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.edit),
                  ],
                ),
                contentPadding: const EdgeInsets.all(10),
                hintText: "Description",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey[200]!, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey[200]!, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey[200]!, width: 1)),
              ),
              maxLines: 10,
              minLines: 5,
              keyboardType: TextInputType.text,
              onChanged: (text) => shopName = text,
              // validator: validateName,
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField2(
              // value: 'Select ',
              // key: UniqueKey(),
              decoration: InputDecoration(
                labelText: 'Area',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 0.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 0.75),
                ),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              isExpanded: true,
              hint: Text(
                'Select area',
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.blue,
              ),
              iconSize: 25,
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              items: ['area1', 'area2'].map(
                (item) {
                  // print(item);
                  return DropdownMenuItem<String>(
                    value: item,
                    // key: UniqueKey(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
              onChanged: (value) {
                // print('onsaved  $value');
                // ctx.addSelectedAttribute(
                //     ctx.attributes[index]['name'],
                //     value.toString());
                // addCategoryController.setCategoryType(
                //     categoryId: widget.addCategoryModel.id,
                //     categoryType: value);
              },
              onSaved: (value) {
                // selectedValue = value.toString();
              },
            )
          ],
        ),
      ),
    );
  }
}
