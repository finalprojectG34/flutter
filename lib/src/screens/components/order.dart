import 'package:flutter/material.dart';

import 'order_detail.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView(
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade100,
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.event),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Accepted'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('1')
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.green.shade100,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.description,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Pending',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.green.shade100,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.stop_circle_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Canceled',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.green.shade100,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'On delivery',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.green.shade100,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Delivered',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          OrderDetail()
        ],
      ),
    );
  }
}
