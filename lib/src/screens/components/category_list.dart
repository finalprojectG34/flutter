import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/components/category_item.dart';

import '../../utils/Constants.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            CategoryItem(
                category:
                    Category(image: Constants.foodImagePath, name: "Food")),
            CategoryItem(
                category: Category(
              image: Constants.candyImagePath,
              name: "Candies",
            )),
            CategoryItem(
                category: Category(
              image: Constants.watchImagePath,
              name: "Watches",
            )),
            CategoryItem(
                category: Category(
              image: Constants.sneakersImagePath,
              name: "Sneakers",
            )),
            CategoryItem(
                category: Category(
              image: Constants.cosmeticsImagePath,
              name: "Beauty",
            )),
            CategoryItem(
                category: Category(
              image: Constants.sampleImagePath,
              name: "Smartphones",
            )),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text('More category'),
        )
      ],
    );
  }
}
