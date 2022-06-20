import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app.dart';
import 'add_item_ctx.dart';

class TextAttribute extends StatefulWidget {
  TextAttribute({Key? key, required this.attribute}) : super(key: key);
  Attribute attribute;

  @override
  State<TextAttribute> createState() => _TextAttributeState();
}

class _TextAttributeState extends State<TextAttribute> {
  AddItemController addItemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextField(
      // focusNode: categoryNameFocusNode,
      // controller: categoryNameController,
      // keyboardType: ctx.attributes[index]['display'] == 'text'
      //     ? TextInputType.text
      //     : TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.75),
        ),
        isDense: true,
        labelText: widget.attribute.name,

        // contentPadding: EdgeInsets.only(left: 20)
      ),
      onChanged: (value) {
        addItemController.addSelectedAttribute(
            widget.attribute.name!, value.toString());
      },
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
