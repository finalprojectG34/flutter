import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sms/src/models/item_search_filter.dart';
import 'package:sms/src/screens/components/error_page.dart';
import 'package:sms/src/screens/search_item/search_item_ctx.dart';

import '../../app.dart';
import '../components/searchbar.dart';
import '../components/single_item_search_component.dart';
import '../filter/filter.dart';

class SearchItemList extends StatefulWidget {
  final String searchText;

  const SearchItemList({Key? key, required this.searchText}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchItemListState();
  }
}

class SearchItemListState extends State<SearchItemList> {
  final ctx = Get.find<SearchController>();
  String query = "";
  late ItemSearchFilter itemSearchFilter;
  static const _pageSize = 20;

  final PagingController<int, Item> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  initState() {
    itemSearchFilter = ItemSearchFilter(
        searchTerm: widget.searchText,
        // attributes: [
        //   FilterAttributes(
        //       name: "condition", values: ["New", "Used", "Not Specified"])
        // ],
        reqPagInfo: ReqPagInfo());
    _pagingController.addPageRequestListener((pageKey) {
      itemSearchFilter =
          itemSearchFilter.copyWith(reqPagInfo: ReqPagInfo(pageNo: pageKey));
      _fetchPage(itemSearchFilter);
    });
    _fetchPage(itemSearchFilter);
    super.initState();
  }

  Future<void> _fetchPage(ItemSearchFilter _searchFilter) async {
    try {
      final newItems = await ctx.getSearchItems(_searchFilter);
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
        appBar: AppBar(
            // title: Text(searchItemName),
            actions: [
              IconButton(
                  onPressed: () {
                    // Get.to(const Filter());
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      context: context,
                      builder: (context) => Filter(
                        itemSearchFilter: itemSearchFilter,
                        onFilter: (itemFilter) {
                          itemSearchFilter =
                              itemFilter.copyWith(reqPagInfo: ReqPagInfo());
                          ctx.getSearchItems(itemSearchFilter);
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.filter_alt))
            ]),
        body: Column(
          children: [
            const SizedBox(),
            SearchBar(
              onSearch: (value) {
                // searchItemCtx.getMockSearchItems();
                query = value;
                itemSearchFilter = itemSearchFilter.copyWith(
                    searchTerm: query, reqPagInfo: ReqPagInfo());
                ctx.getSearchItems(itemSearchFilter);
              },
              searchText: widget.searchText,
            ),
            Obx(() {
              if (ctx.isLoading.isTrue) {
                return const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              }
              if (ctx.items.value != null) {
                if (ctx.items.value!.isNotEmpty) {
                  // return ListView.builder(
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) => SingleItemSearch(
                  //     variable: ctx.items.value![index],
                  //     item: ctx.items.value![index],
                  //   ),
                  //   itemCount: ctx.items.value!.length,
                  // );
                  return PagedGridView<int, Item>(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .65,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    pagingController: _pagingController,
                    showNewPageProgressIndicatorAsGridChild: false,
                    builderDelegate: PagedChildBuilderDelegate<Item>(
                      itemBuilder: (context, item, index) => SingleItemSearch(
                        item: item,
                      ),
                    ),
                  );
                }
                return const Expanded(
                    child: Center(
                  child: Text("No Item"),
                ));
              }
              return Expanded(
                child: Center(child: errorPage(
                  onTryAgain: () {
                    ctx.getSearchItems(itemSearchFilter);
                  },
                )),
              );
            })
          ],
        ));
  }

  @override
  dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
