import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryItem({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => CategoryDetailPage());
          },
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (error, o, s) => const Text(""),
            ),
            radius: 40,
          ),
        ),
        Text(
          title,
        )
      ],
    );
  }
}
