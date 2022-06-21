import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/category_page/category_list.dart';
import 'package:sms/src/screens/components/suggested_items.dart';
import 'package:sms/src/screens/search_item/search_item_list.dart';
import 'package:sms/src/screens/shops_list/shop_list.dart';

import '../components/searchbar.dart';
import '../items/item_list.dart';
import '../items/item_mini_view/item_mini_detail.dart';
import 'AppCtx.dart';

class Home extends StatefulWidget {
  final bool hasSearchBar;

  const Home({Key? key, required this.hasSearchBar}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.hasSearchBar)
          SearchBar(
            onSearch: (value) {
              Get.to(SearchItemList(searchText: value));
            },
          ),
        GetX<AppController>(
          builder: (ctx) {
            return Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SuggestedItems(),
                  const SizedBox(height: 15.0),
                  const CategoryList(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Items',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                        TextButton(
                            onPressed: () {
                              Get.to(const ItemList());
                            },
                            child: const Text('See more'))
                      ],
                    ),
                  ),
                  if (ctx.isGettingItems.isTrue)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ctx.itemList == null
                      ? ctx.getItemError.isTrue
                      ? Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                              ctx.err.value,
                            )),
                        const SizedBox(width: 20),
                        TextButton(
                            onPressed: () {
                              ctx.getItems();
                            },
                            child: const Text('Retry'))
                      ],
                    ),
                  )
                      : Container()
                      : ctx.itemList!.isEmpty
                      ? const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('No items found'),
                      ))
                      : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .6,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) => ItemMiniDetail(
                        item: (ctx.itemList as List)[index]),
                    itemCount: (ctx.itemList as List).length,
                  ),

                  // GridView.count(
                  //   childAspectRatio: 1.1,
                  //   crossAxisCount: 2,
                  //   children: [
                  //     ShopItem(shop: mockShop),
                  //     ShopItem(
                  //       shop: mockShop,
                  //     ),
                  //   ],
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   crossAxisSpacing: 3,
                  //   padding: const EdgeInsets.all(8),
                  //   mainAxisSpacing: 3,
                  // ),
                  const ShopList(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    appController.getItems();
  }
}
