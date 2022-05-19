import 'package:flutter/material.dart';
import 'package:sms/src/screens/components/category_select.dart';

class SubcategorySelect extends StatelessWidget {
  final String name;
  final bool isSelectable;
  final List<Map<String, dynamic>> subcategories;

  const SubcategorySelect(
      {Key? key,
      required this.name,
      required this.subcategories,
      required this.isSelectable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: [
          CategorySelect(
            name: name,
            isOnSubcategoryPage: true,
            isSelectable: isSelectable,
            hasSubcategory: false,
            subcategories: subcategories,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CategorySelect(
                name: subcategories[index]['name'],
                isOnSubcategoryPage: false,
                isSelectable: subcategories[index]['isCreatable'],
                hasSubcategory: subcategories[index]['hasSubcategory'],
                subcategories: subcategories,
              ),
              itemCount: subcategories.length,
            ),
          )
        ],
      ),
    );
  }
}
