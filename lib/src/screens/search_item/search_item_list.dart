import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:sms/src/screens/filter/filter.dart';
import 'package:sms/src/screens/search_item/search_item_ctx.dart';

import '../components/single_item_search_component.dart';

class SearchItemList extends StatelessWidget {
  final String searchItemName;

  const SearchItemList({Key? key, required this.searchItemName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(searchItemName)),
      body: GetX<SearchController>(builder: (ctx) {
        return ctx.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => SingleItemSearch(
                    variable: ctx.mockSearchItem!['getAllItems'][index]),
                itemCount: ctx.mockSearchItem!['getAllItems'].length,
              );
      }),
    );
  }
}
