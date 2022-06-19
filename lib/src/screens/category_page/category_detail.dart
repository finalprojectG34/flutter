import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sms/src/models/item_search_filter.dart';
import 'package:sms/src/screens/category_page/category_detial_ctx.dart';
import 'package:sms/src/screens/components/category_item.dart';
import 'package:sms/src/screens/components/error_page.dart';

import '../../models/models.dart';
import '../items/item_mini_view/item_mini_detail.dart';

class CategoryDetailPage extends StatefulWidget {
  final Category category;

  const CategoryDetailPage({Key? key, required this.category})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CategoryDetailPageState();
  }
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  final CategoryDetailController ctx = Get.find();
  static const _pageSize = 20;
  late ItemSearchFilter _itemSearchFilter;

  final PagingController<int, Item> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  initState() {
    if (widget.category.subCategories != null &&
        widget.category.subCategories!.isNotEmpty) {
      _itemSearchFilter = ItemSearchFilter(
          categoryId: widget.category.subCategories![0].id,
          reqPagInfo: ReqPagInfo());
    } else {
      _itemSearchFilter = ItemSearchFilter(
          categoryId: widget.category.id, reqPagInfo: ReqPagInfo());
    }
    _pagingController.addPageRequestListener((pageKey) {
      _itemSearchFilter =
          _itemSearchFilter.copyWith(reqPagInfo: ReqPagInfo(pageNo: pageKey));
      _fetchPage(_itemSearchFilter);
    });
    _fetchPage(_itemSearchFilter);

    super.initState();
  }

  Future<void> _fetchPage(ItemSearchFilter _searchFilter) async {
    try {
      final newItems = await ctx.getItemsByCatID(_searchFilter);
      if (newItems != null) {
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = _searchFilter.reqPagInfo.pageNo + newItems.length;
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
      appBar: AppBar(title: Text('${widget.category.name}')),
      body: Column(
        children: [
          if (widget.category.subCategories != null &&
              widget.category.subCategories!.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sub Category',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      _itemSearchFilter = _itemSearchFilter.copyWith(
                          categoryId: widget.category.subCategories![index].id,
                          reqPagInfo: ReqPagInfo());
                      _fetchPage(_itemSearchFilter);
                    },
                    child: CategoryItem(
                        category: widget.category.subCategories![index]),
                  );
                },
                itemCount: widget.category.subCategories!.length,
              ),
            ),
          ],
          Obx(() {
            if (ctx.isLoading.isTrue) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (ctx.itemList.value != null) {
              if (ctx.itemList.value!.isEmpty) {
                return const Center(
                  child: Text("No item"),
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
                  itemBuilder: (context, item, index) => ItemMiniDetail(
                    item: item,
                  ),
                ),
              );
            }
            return errorPage(onTryAgain: () {
              _fetchPage(_itemSearchFilter);
            });
          })
        ],
      ),
    );
  }
}
