import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/screens/add_item/add_item_ctx.dart';
import 'package:sms/src/screens/add_item/subcategory_list_page.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: GetX<AddItemController>(builder: (ctx) {
          return ListView.builder(
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.blue.shade50,
                      child: ListTile(
                          title: Text(ctx.categoryList![index].name!),
                          onTap: () {
                            ctx.getOneCategory(ctx.categoryList![index].id!);
                            if (ctx.categoryList![index].hasSubcategory! ==
                                false) {
                              ctx.selectedCategoryName([]);
                              ctx.selectedCategoryId([]);

                              ctx.selectedCategoryName
                                  .add(ctx.categoryList![index].name!);
                              ctx.selectedCategoryId
                                  .add(ctx.categoryList![index].id!);

                              ctx.getCategoryDetail(
                                  ctx.categoryList![index].id!);

                              Get.back();
                            } else {
                              ctx.selectedCategoryName([]);
                              ctx.selectedCategoryId([]);

                              ctx.selectedCategoryName
                                  .add(ctx.categoryList![index].name!);
                              ctx.selectedCategoryId
                                  .add(ctx.categoryList![index].id!);
                              Get.to(
                                () => SubCategoryListPage(
                                  subcategoryName:
                                      ctx.categoryList![index].name!,
                                ),
                              );
                            }
                          },
                          trailing: ctx.categoryList![index].hasSubcategory!
                              ? const Icon(Icons.arrow_forward_rounded)
                              : null),
                    ),
                  ),
              itemCount: ctx.categoryList!.length);
        }));
  }
}
