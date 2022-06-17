import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/order_page/received_orders/received_order_detail.dart';

import '../order_page_ctx.dart';
import '../single_order.dart';

class ReceivedOrderStatus extends StatefulWidget {
  final String status;

  const ReceivedOrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  State<ReceivedOrderStatus> createState() => _ReceivedOrderStatusState();
}

class _ReceivedOrderStatusState extends State<ReceivedOrderStatus> {
  OrderPageController orderPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<OrderPageController>(
      builder: (ctx) {
        return RefreshIndicator(
          onRefresh: () async {
            await ctx.getReceivedOrders(widget.status);
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
                    Get.to(() => ReceivedOrderDetail(orderId: order.id!));
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
