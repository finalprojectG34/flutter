import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:sms/src/screens/search_item/search_item_ctx.dart';

import '../components/searchbar.dart';
import '../components/single_item_search_component.dart';
import '../filter/filter.dart';

// class SearchItemList extends StatelessWidget {
//   final String searchItemName;
//
//   const SearchItemList({Key? key, required this.searchItemName})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(searchItemName), actions: [
//         IconButton(
//             onPressed: () {
//               // Get.to(const Filter());
//               showModalBottomSheet(
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   ),
//                 ),
//                 context: context,
//                 builder: (context) => const Filter(),
//               );
//             },
//             icon: const Icon(Icons.filter_alt))
//       ]),
//       body: GetX<SearchController>(builder: (ctx) {
//         return ctx.isLoading.isTrue
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Column(
//                 children: [
//                   const SizedBox(),
//                   const SearchBar(),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) => SingleItemSearch(
//                         variable: ctx.mockSearchItem!['getAllItems'][index]),
//                     itemCount: ctx.mockSearchItem!['getAllItems'].length,
//                   ),
//                 ],
//               );
//       }),
//     );
//   }
// }
class SearchItemList extends StatefulWidget {
  final String searchItemName;

  const SearchItemList({Key? key, required this.searchItemName})
      : super(key: key);

  @override
  State<SearchItemList> createState() => _SearchItemListState();
}

class _SearchItemListState extends State<SearchItemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(widget.searchItemName), actions: [
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
                builder: (context) => const Filter(),
              );
            },
            icon: const Icon(Icons.filter_alt))
      ]),
      body: GetX<SearchController>(builder: (ctx) {
        return ctx.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  const SizedBox(),
                  SearchBar(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => SingleItemSearch(
                        variable: ctx.mockSearchItem!['getAllItems'][index]),
                    itemCount: ctx.mockSearchItem!['getAllItems'].length,
                  ),
                ],
        );
      }),
    );
  }
}
