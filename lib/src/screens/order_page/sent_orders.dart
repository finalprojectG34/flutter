import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:group_button/group_button.dart';
import 'package:sms/src/screens/order_page/order_page_ctx.dart';
import 'package:sms/src/screens/order_page/sent_order_detail.dart';

import 'sent_orders/sent_orders.dart';
import 'single_order.dart';

class SentOrders extends StatefulWidget {
  const SentOrders({Key? key}) : super(key: key);

  @override
  State<SentOrders> createState() => _SentOrdersState();
}

class _SentOrdersState extends State<SentOrders> with TickerProviderStateMixin {
  // TabController? _tabController;
  List<int> aa = [1, 2, 3, 4, 5];

  OrderPageController orderPageController = Get.find();

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 5, vsync: this);
  }

  int id = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sent Orders'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.description)),
              Tab(icon: Icon(Icons.event)),
              Tab(icon: Icon(Icons.stop_circle_outlined)),
              Tab(icon: Icon(Icons.shopping_cart)),
              Tab(icon: Icon(Icons.check)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SentOrderStatus(status: "PENDING"),
            SentOrderStatus(status: "ACCEPTED"),
            SentOrderStatus(status: "CANCELED"),
            SentOrderStatus(status: "ON_DELIVERY"),
            SentOrderStatus(status: "DELIVERED"),
          ],
        ),
      ),
    );
  }
}
