import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page/AppCtx.dart';

class SearchBar extends StatefulWidget {
  final Function(String text) onSearch;
  final String? searchText;

  const SearchBar({Key? key, required this.onSearch, this.searchText})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // SearchController searchController = Get.find();
  TextEditingController searchTextEditingController = TextEditingController();
  String searchItemName = "";

  // @override
  // initState() {
  //
  //   super.initState();
  // }

  // FocusNode searchBarFocusNode = FocusNode();
  AppController appController = Get.find();

  void onSearchBarFocusChange() {
    if (!appController.searchBarFocusNode.hasFocus) {
      appController.isSearchBarActive(false);
      appController.searchBarFocusNode.unfocus();
    }
  }

  @override
  void initState() {
    searchItemName = widget.searchText.toString();

    appController.searchBarFocusNode.addListener(onSearchBarFocusChange);
    if (widget.searchText != null) {
      searchTextEditingController.text = widget.searchText!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(builder: (ctx) {
      if (ctx.isSearchBarActive.isTrue) {
        ctx.searchBarFocusNode.requestFocus();
        print(
            'req focus  iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
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
                    controller: searchTextEditingController,
                    // focusNode: ctx.searchBarFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                    // style: TextStyle(fontSize: 13),
                    maxLines: 1,
                    onChanged: (text) => searchItemName = text,
                    onEditingComplete: () {
                      // ctx.isSearchBarActive(false);
                      // ctx.searchBarFocusNode.unfocus();
                    },
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.green[200]),
                  onPressed: () {
                    if (searchItemName.isNotEmpty) {
                      widget.onSearch(searchItemName);
                    }
                  }),
            ],
          ),
        ),
      );
    });
  }
}
