import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/category_page/all_categories.dart';
import 'package:sms/src/screens/category_page/categories_list_ctx.dart';
import 'package:sms/src/screens/components/category_item.dart';

import '../../utils/Constants.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetX<CategoryListController>(builder: (ctrl) {
          if (ctrl.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (ctrl.categoryList.value != null) {
            if (ctrl.categoryList.value!.isNotEmpty) {
              return Column(children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    print("images");
                    print(
                        "${ctrl.categoryList.value![index].image?.imagePath}");
                    return InkWell(
                      onTap: () {
                        Get.to(CategoryDetailPage(
                            category: ctrl.categoryList.value![index]));
                      },
                      child: CategoryItem(
                          category: ctrl.categoryList.value![index]),
                    );
                  },
                  itemCount: ctrl.categoryList.value!.length <= 6
                      ? ctrl.categoryList.value!.length
                      : 6,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(AllCategories(
                        allCategories: (ctrl.categoryList.value!)));
                  },
                  child: const Text('More category'),
                )
              ]);
            }
            return const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        })
      ],
    );
  }

  _listOfCategories() {
    return [
      CategoryItem(
          category: Category(
              image: ImageModel(imagePath: Constants.foodImagePath),
              name: "Food")),
      CategoryItem(
          category: Category(
        image: ImageModel(imagePath: Constants.candyImagePath),
        name: "Candies",
      )),
      CategoryItem(
          category: Category(
        image: ImageModel(imagePath: Constants.watchImagePath),
        name: "Watches",
      )),
      CategoryItem(
          category: Category(
        image: ImageModel(imagePath: Constants.sneakersImagePath),
        name: "Sneakers",
      )),
      CategoryItem(
          category: Category(
        image: ImageModel(imagePath: Constants.cosmeticsImagePath),
        name: "Beauty",
      )),
      CategoryItem(
          category: Category(
        image: ImageModel(imagePath: Constants.sampleImagePath),
        name: "Smartphones",
      )),
    ];
  }
}
