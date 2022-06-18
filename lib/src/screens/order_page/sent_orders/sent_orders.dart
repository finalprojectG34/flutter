import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order_page_ctx.dart';
import '../single_order.dart';
import 'sent_order_detail.dart';

class SentOrderStatus extends StatefulWidget {
  final String status;
  final String tabName;

  const SentOrderStatus({Key? key, required this.status, required this.tabName})
      : super(key: key);

  @override
  State<SentOrderStatus> createState() => _SentOrderStatusState();
}

class _SentOrderStatusState extends State<SentOrderStatus> {
  @override
  Widget build(BuildContext context) {
    return GetX<OrderPageController>(
      builder: (ctx) {
        return RefreshIndicator(
          onRefresh: () async {
            await ctx.getSentOrders(widget.status);
          },
          child: ctx.isOrderLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : ctx.isOrderError.isTrue
                  ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Error happened! Please,"),
                          TextButton(
                              onPressed: () {
                                ctx.getReceivedOrders(widget.status);
                              },
                              child: Text("Retry"))
                        ],
                      ),
                    )
                  : ctx.orderList!.isEmpty
                      ? Center(
                          child: Text("No ${widget.tabName} orders yet."),
                        )
                      : ListView(
                          children: [
                            if (ctx.isOrderLoading.isFalse)
                              ...ctx.orderList!
                                  .map((order) => GestureDetector(
                                        onTap: () {
                                          ctx.getOrderById(order.id!);
                                          Get.to(() => SentOrderDetail(
                                              orderId: order.id!));
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
