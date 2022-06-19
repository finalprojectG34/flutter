import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/models/shop.dart';
import 'package:sms/src/screens/components/shop_item.dart';
import 'package:sms/src/screens/shops_list/shop_detail.dart';

class AllShopsList extends StatelessWidget {
  final List<Shop> shops;

  const AllShopsList({Key? key, required this.shops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shops")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2),
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.to(ShopDetail(shop: shops[index]));
          },
          child: ShopItem(
            shop: shops[index],
          ),
        ),
        itemCount: shops.length,
      ),
    );
  }
}
