import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/order_page/order_page_ctx.dart';

import 'sent_orders/sent_orders.dart';

class SentOrdersPage extends StatefulWidget {
  const SentOrdersPage({Key? key}) : super(key: key);

  @override
  State<SentOrdersPage> createState() => _SentOrdersPageState();
}

class _SentOrdersPageState extends State<SentOrdersPage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> aa = [
    'PENDING',
    'ACCEPTED',
    'CANCELED',
    'ON_DELIVERY',
    'DELIVERED'
  ];

  OrderPageController orderPageController = Get.find();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    orderPageController.getSentOrders(aa[0]);
    _tabController.addListener(() {
      orderPageController.getSentOrders(aa[_tabController.index]);
    });
  }

  int id = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sent Orders'),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.description), text: 'Pending'),
              Tab(icon: Icon(Icons.event), text: 'Accepted'),
              Tab(icon: Icon(Icons.stop_circle_outlined), text: 'Canceled'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'On Delivery'),
              Tab(icon: Icon(Icons.check), text: 'Delivered'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
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
