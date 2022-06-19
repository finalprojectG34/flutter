import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/add_item/add_item_ctx.dart';

class SubCategoryListPage extends StatelessWidget {
  String subcategoryName;

  SubCategoryListPage({Key? key, required this.subcategoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(subcategoryName),
        ),
        body: GetX<AddItemController>(builder: (ctx) {
          return ctx.isCategoryFetchedFromDB.isFalse
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.blue.shade50,
                      child: ListTile(
                        title: Text(
                          ctx.subCategoryList![index].name!,
                        ),
                        onTap: () {
                          // Get.to(
                          //       () => CategoryListPage(
                          //     ctx: ctx,
                          //     type: 'subcategory',
                          //     subcategoryName: ctx.categoryList![index].name!,
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ),
                  itemCount: ctx.subCategoryList!.length,
                );
        }));
  }
}
