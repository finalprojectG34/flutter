import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/components/error_page.dart';
import 'package:sms/src/screens/components/single_item_search_component.dart';
import 'package:sms/src/screens/my_items/my_items_ctx.dart';

class MyItem extends StatelessWidget {
  const MyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetX<MyItemsController>(
      builder: (ctx) {
        if (ctx.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (ctx.items.value != null) {
          if (ctx.items.value!.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return SingleItemSearch(item: ctx.items.value![index]);
              },
              itemCount: ctx.items.value!.length,
            );
          } else {
            return const Center(
              child: Text("No Item"),
            );
          }
        }
        return errorPage(
          onTryAgain: () {
            ctx.getSearchItems();
          },
        );
      },
    ));
  }
}
