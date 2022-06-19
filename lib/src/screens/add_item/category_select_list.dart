import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/components/category_select.dart';

import 'add_item_ctx.dart';

class CategorySelectList extends StatelessWidget {
  final bool isOnSubcategoryPage;

  CategorySelectList({Key? key, required this.isOnSubcategoryPage})
      : super(key: key);
  final AddItemController addItemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        addItemController.categorySelectPages--;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Select category')),
        body: GetX<AddItemController>(builder: (ctx) {
          return ctx.isCategoryFetchedFromDB.isFalse
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  // shrinkWrap: true,
                  itemBuilder: (context, index) => CategorySelect(
                    name: ctx.categoryList![index].name!,
                    isOnSubcategoryPage: isOnSubcategoryPage,
                    isSelectable: ctx.mockCategory!['getAllCategories'][index]
                        ['isCreatable'],
                    hasSubcategory: ctx.mockCategory!['getAllCategories'][index]
                        ['hasSubcategory'],
                    subcategories: ctx.mockCategory!['getAllCategories'][index]
                        ['subCategories'],
                    attributes: ctx.mockCategory!['getAllCategories'][index]
                        ['attributes'],
                  ),
                  itemCount: ctx.categoryList!.length,
                );
        }),
      ),
    );
  }
}
