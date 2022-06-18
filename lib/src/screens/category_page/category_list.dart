import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/items/item_list_ctx.dart';

import '../components/category_item.dart';
import '../components/error_page.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  static const _pageSize = 20;
  final ItemListController itemListCtx = Get.find();

  final PagingController<int, Item> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _fetchPage(0);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await itemListCtx.getItems(pageKey, _pageSize);
      if (newItems != null) {
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: GetX<ItemListController>(
          builder: (ctx) {
            if (ctx.isLoading.isTrue) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (ctx.itemList.value != null) {
              if (ctx.itemList.value!.isEmpty) {
                return const Center(
                  child: Text("No category"),
                );
              }
              return PagedGridView<int, Item>(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .65,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                pagingController: _pagingController,
                showNewPageProgressIndicatorAsGridChild: false,
                builderDelegate: PagedChildBuilderDelegate<Item>(
                  itemBuilder: (context, item, index) => CategoryItem(
                    item: item,
                  ),
                ),
              );
            }
            return errorPage(onTryAgain: () {
              _fetchPage(0);
            });
          },
        ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
