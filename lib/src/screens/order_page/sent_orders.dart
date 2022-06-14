import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:group_button/group_button.dart';
import 'package:sms/src/screens/order_page/order_page_ctx.dart';
import 'package:sms/src/screens/order_page/sent_order_detail.dart';

import 'single_order.dart';

class SentOrders extends StatefulWidget {
  const SentOrders({Key? key}) : super(key: key);

  @override
  State<SentOrders> createState() => _SentOrdersState();
}

class _SentOrdersState extends State<SentOrders> with TickerProviderStateMixin {
  // TabController? _tabController;
  List<int> aa = [1, 2, 3, 4, 5];

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 5, vsync: this);
  }

  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sent Orders'),
      ),
      body: GetX<OrderPageController>(
        builder: (ctx) {
          return RefreshIndicator(
            onRefresh: () async {
              await ctx.getOrder("PENDING");
            },
            child: ListView(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    child: GroupButton<Map<String, dynamic>>(
                      buttons: const [
                        {
                          'name': 'Pending',
                          'icon': Icons.description,
                          'amount': 1,
                          'color': Colors.orange,
                          'value': "PENDING",
                        },
                        {
                          'name': 'Accepted',
                          'icon': Icons.event,
                          'amount': 1,
                          'color': Colors.amberAccent,
                          'value': "ACCEPTED",
                        },
                        {
                          'name': 'Canceled',
                          'icon': Icons.stop_circle_outlined,
                          'amount': 1,
                          'color': Colors.red,
                          'value': "CANCELED",
                        },
                        {
                          'name': 'On Delivery',
                          'icon': Icons.shopping_cart,
                          'amount': 1,
                          'color': Colors.grey,
                          'value': "ON_DELIVERY",
                        },
                        {
                          'name': 'Delivered',
                          'icon': Icons.check,
                          'amount': 1,
                          'color': Colors.green,
                          'value': "DELIVERED",
                        },
                      ],
                      onSelected: (data, index, isSelected) {
                        ctx.getOrder(data['value']);
                      },
                      buttonBuilder: (selected, data, context) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selected ? Colors.green.shade100 : null,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                data['icon'],
                                color: data['color'],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data['name'],
                                style: TextStyle(
                                  color: data['color'],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${data['amount']}',
                                style: TextStyle(
                                  color: data['color'],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (ctx.isOrderLoading.isTrue)
                  const Center(child: CircularProgressIndicator()),
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
      ),
    );
  }
}
