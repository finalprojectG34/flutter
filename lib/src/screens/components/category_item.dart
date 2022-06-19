import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/app.dart';

import '../category_page/category_detail.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CategoryDetailPage(
          category: category,
        ));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Image.network(
              "${category.image}",
              fit: BoxFit.cover,
              errorBuilder: (error, o, s) => const Text(""),
            ),
            radius: 40,
          ),
          Text(
            "${category.name}",
          )
        ],
      ),
    );
  }
}
