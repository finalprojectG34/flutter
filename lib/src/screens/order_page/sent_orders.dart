import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/order_page/order_page_ctx.dart';

import 'sent_orders/sent_orders.dart';

class SentOrders extends StatefulWidget {
  const SentOrders({Key? key}) : super(key: key);

  @override
  State<SentOrders> createState() => _SentOrdersState();
}

class _SentOrdersState extends State<SentOrders> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> aa = [
    'PENDING',
    'ACCEPTED',
    'CANCELED',
    'ON_DELIVERY',
    'DELIVERED'
  ];
  int _selectedIndex = 0;
  OrderPageController orderPageController = Get.find();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    orderPageController.getOrder(aa[0]);
    _tabController.addListener(() {
      // setState(() {
      //   _selectedIndex = _tabController.index;
      // });
      orderPageController.getOrder(aa[_tabController.index]);
      print("Selected Index: " + _tabController.index.toString());
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
            tabs: [
              Tab(
                icon: Icon(Icons.description),
                text: 'Pending',
              ),
              Tab(icon: Icon(Icons.event), text: 'Accepted'),
              Tab(icon: Icon(Icons.stop_circle_outlined), text: 'Canceled'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'On Delivery'),
              Tab(icon: Icon(Icons.check), text: 'Delivered'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
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
