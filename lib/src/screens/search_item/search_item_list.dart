import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/models/item_search_filter.dart';
import 'package:sms/src/screens/components/error_page.dart';
import 'package:sms/src/screens/search_item/search_item_ctx.dart';

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
  final searchItemCtx = Get.find<SearchController>();
  String query = "";
  late ItemSearchFilter itemSearchFilter;

  @override
  initState() {
    itemSearchFilter =
        ItemSearchFilter(searchTerm: widget.searchText, attributes: [
      FilterAttributes(
          name: "condition", values: ["New", "Used", "Not Specified"])
    ]);
    searchItemCtx.getSearchItems(itemSearchFilter);
    super.initState();
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
                          itemSearchFilter = itemFilter;
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
                itemSearchFilter.searchTerm = query;
                searchItemCtx.getSearchItems(itemSearchFilter);
              },
              searchText: widget.searchText,
            ),
            Obx(() {
              if (searchItemCtx.isLoading.isTrue) {
                return const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              }
              if (searchItemCtx.items.value != null) {
                if (searchItemCtx.items.value!.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SingleItemSearch(
                      variable: searchItemCtx.items.value![index],
                      item: searchItemCtx.items.value![index],
                    ),
                    itemCount: searchItemCtx.items.value!.length,
                  );
                }
                return const Center(
                  child: Text("No Item"),
                );
              }
              return Expanded(
                child: Center(child: errorPage(
                  onTryAgain: () {
                    searchItemCtx.getSearchItems(itemSearchFilter);
                  },
                )),
              );
            })
          ],
        ));
  }
}
