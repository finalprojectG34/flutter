import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order_page_ctx.dart';
import '../sent_order_detail.dart';
import '../single_order.dart';

class SentOrderStatus extends StatefulWidget {
  final String status;

  const SentOrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  State<SentOrderStatus> createState() => _SentOrderStatusState();
}

class _SentOrderStatusState extends State<SentOrderStatus> {
  OrderPageController orderPageController = Get.find();

  @override
  void initState() {
    super.initState();
    // getStatus();
    // orderPageController.getOrder(widget.status);
    // _tabController = TabController(length: 5, vsync: this);
  }

  getStatus() async {
    await orderPageController.getOrder(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<OrderPageController>(
      builder: (ctx) {
        return RefreshIndicator(
          onRefresh: () async {
            await ctx.getOrder(widget.status);
          },
          child: ctx.isOrderLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    if (ctx.isOrderLoading.isFalse)
                      ...ctx.orderList!
                          .map((order) => GestureDetector(
                                onTap: () {
                                  ctx.getOrderById(order.id!);
                                  Get.to(() => const SentOrderDetail());
                                },
                                child: SingleOrder(order: order),
                              ))
                          .toList()
                  ],
                ),
        );
      },
    );
  }
}
