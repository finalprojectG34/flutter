import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/shops_list/all_shops_list.dart';
import 'package:sms/src/screens/shops_list/shop_detail.dart';
import 'package:sms/src/screens/shops_list/shop_list_ctx.dart';

import '../components/shop_item.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                    var ctrl = Get.find<ShopListController>();
                    if (ctrl.shopList.value != null &&
                        ctrl.shopList.value!.isNotEmpty) {
                      Get.to(AllShopsList(
                        shops: ctrl.shopList.value!,
                      ));
                    }
                  },
                  child: const Text('See more'))
            ],
          ),
        ),
        GetX<ShopListController>(builder: (ctrl) {
          if (ctrl.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (ctrl.shopList.value != null) {
            if (ctrl.shopList.value!.isNotEmpty) {
              return Column(children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(ShopDetail(shop: ctrl.shopList.value![index]));
                      },
                      child: ShopItem(shop: ctrl.shopList.value![index]),
                    );
                  },
                  itemCount: ctrl.shopList.value!.length <= 6
                      ? ctrl.shopList.value!.length
                      : 6,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(AllShopsList(shops: ctrl.shopList.value!));
                  },
                  child: const Text('More shops'),
                )
              ]);
            }
            return const Center(
              child: Text("No shop"),
            );
          }
          return const SizedBox.shrink();
        })
      ],
    );
  }
}
