import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/add_item/add_item_ctx.dart';

class DropdownAttr extends StatefulWidget {
  DropdownAttr({Key? key, required this.attribute}) : super(key: key);
  Attribute attribute;

  @override
  State<DropdownAttr> createState() => _DropdownAttrState();
}

class _DropdownAttrState extends State<DropdownAttr> {
  AddItemController addItemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        labelText: widget.attribute.name,
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
        'Select ${widget.attribute.name}',
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
      items: (widget.attribute.values as List<String>).map(
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
      //     .attributes(ctx.attributes[index]['options'] as List<String>)
      //     .map(
      //   (item) {
      //     // print(item);
      //     return DropdownMenuItem<String>(
      //       value: item,
      //       // key: UniqueKey(),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Expanded(
      //             child: Text(
      //               item,
      //               style: const TextStyle(
      //                 fontSize: 14,
      //               ),
      //               textAlign: TextAlign.center,
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ).toList(),
      onChanged: (value) {
        // print('onsaved  $value');
        addItemController.addSelectedAttribute(
            widget.attribute.name!, value.toString());
        // addCategoryController.setCategoryType(
        //     categoryId: widget.addCategoryModel.id,
        //     categoryType: value);
      },
      onSaved: (value) {
        // selectedValue = value.toString();
      },
    );
  }
}
