import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../components/category_item.dart';

class AllCategories extends StatelessWidget {
  final List<Category> allCategories;

  const AllCategories({Key? key, required this.allCategories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(category: allCategories[index]);
          },
          itemCount: 6,
        ));
  }
}
