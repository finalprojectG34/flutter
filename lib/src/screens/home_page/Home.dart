import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/data/repository/shop_repository.dart';
import 'package:sms/src/screens/components/category_list.dart';
import 'package:sms/src/screens/components/suggested_items.dart';
import 'package:sms/src/screens/shops_list/shops_list.dart';

import '../components/searchbar.dart';
import '../components/shop_item.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.hasSearchBar) const SearchBar(),
        GetX<AppController>(
          builder: (ctx) {
            // appController.itemList =
            //     ((ctx.itemList as List)
            //             .map((json) => Item.fromJson(json))
            //             .toList())
            //         .obs;
            // appController.getItems();

            return Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SuggestedItems(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const CategoryList(),
                  // if (ctx.isGettingItems.isTrue || ctx.itemList!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Flash Sale',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                        TextButton(
                            onPressed: () {
                              Get.to(const ItemList());
                            },
                            child: const Text('See all'))
                      ],
                    ),
                  ),
                  // if (ctx.getItemError.isTrue)
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //     child: Text(ctx.err.value),
                  //   ),
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
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        ctx.getItems();
                                      },
                                      child: Text('Retry'))
                                ],
                              ),
                            )
                          : Container()
                      : ctx.itemList!.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('No items found'),
                            )
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: .5,
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemBuilder: (context, index) => ItemMiniDetail(
                                  item: (ctx.itemList as List)[index]),
                              itemCount: (ctx.itemList as List).length,
                            ),
                  // GridView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //     childAspectRatio: .5,
                  //     crossAxisCount: 2,
                  //     crossAxisSpacing: 5,
                  //     mainAxisSpacing: 5,
                  //   ),
                  //   itemBuilder: (context, index) => ItemMiniDetail(item: appController.itemList![index]),
                  //   itemCount: appController.itemList?.length,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Visit shops',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                        TextButton(
                            onPressed: () {
                              Get.to(const ShopsList());
                            },
                            child: const Text('See all'))
                      ],
                    ),
                  ),
                  GridView.count(
                    childAspectRatio: 1.1,
                    crossAxisCount: 2,
                    children: [
                      ShopItem(shop: mockShop),
                      ShopItem(
                        shop: mockShop,
                      ),
                    ],
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisSpacing: 3,
                    padding: const EdgeInsets.all(8),
                    mainAxisSpacing: 3,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Text('Latest products',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 16,
                  //               color: Colors.black)),
                  //       TextButton(onPressed: () {}, child: const Text('See all'))
                  //     ],
                  //   ),
                  // ),
                  // GridView.count(
                  //   childAspectRatio: .5,
                  //   crossAxisCount: 2,
                  //   children: const [
                  //     ItemMiniDetail(),
                  //     ItemMiniDetail(),
                  //     ItemMiniDetail(),
                  //     ItemMiniDetail(),
                  //   ],
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   crossAxisSpacing: 5,
                  //   padding: const EdgeInsets.all(8),
                  //   mainAxisSpacing: 5,
                  // ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
