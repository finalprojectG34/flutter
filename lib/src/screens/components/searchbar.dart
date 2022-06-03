import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/search_item/search_item_ctx.dart';

import '../home_page/AppCtx.dart';
import '../search_item/search_item_list.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  SearchController searchController = Get.find();
  String? searchItemName;
  FocusNode searchBarFocusNode = FocusNode();
  AppController appController = Get.find();

  void onSearchBarFocusChange() {
    if (!searchBarFocusNode.hasFocus) {
      appController.isSearchBarActive(false);
    }
  }

  @override
  void initState() {
    super.initState();
    searchBarFocusNode.addListener(onSearchBarFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(builder: (ctx) {
      if (ctx.isSearchBarActive.isTrue) {
        searchBarFocusNode.requestFocus();
      }
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    focusNode: searchBarFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                    // style: TextStyle(fontSize: 13),
                    maxLines: 1,
                    onChanged: (text) => searchItemName = text,
                    onEditingComplete: () {
                      ctx.isSearchBarActive(false);
                    },
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.green[200]),
                onPressed: () {
                  searchController.getMockSearchItems();
                  Get.to(() => SearchItemList(searchItemName: searchItemName!));
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
