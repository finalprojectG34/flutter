import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import 'order_detail.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
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
        title: Text('Orders'),
      ),
      body: ListView(
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              child: GroupButton<Map<String, dynamic>>(
                // options: GroupButtonOptions(),
                buttons: const [
                  {
                    'name': 'Accepted',
                    'icon': Icons.event,
                    'amount': 1,
                    // 'isSelected': true
                  },
                  {
                    'name': 'Pending',
                    'icon': Icons.description,
                    'amount': 1,
                    'color': Colors.orange
                  },
                  {
                    'name': 'canceled',
                    'icon': Icons.stop_circle_outlined,
                    'amount': 1,
                    'color': Colors.red
                  },
                  {
                    'name': 'on delivery',
                    'icon': Icons.shopping_cart,
                    'amount': 1,
                    'color': Colors.grey
                  },
                  {
                    'name': 'delivery',
                    'icon': Icons.check,
                    'amount': 1,
                    'color': Colors.green
                  },
                ],
                buttonBuilder: (selected, data, context) {
                  if (selected) {
                    print('im selected ${data['name']}');
                  }
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
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['name'],
                          style: TextStyle(
                            color: data['color'],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:
              //   [
              //
              //     InkWell(
              //       borderRadius: BorderRadius.circular(10),
              //       onTap: () {},
              //       child: Container(
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.green.shade100,
              //         ),
              //         child: Column(
              //           children: [
              //             Icon(Icons.event),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text('Accepted'),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text('1')
              //           ],
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //       borderRadius: BorderRadius.circular(10),
              //       onTap: () {},
              //       child: Container(
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           // color: Colors.green.shade100,
              //         ),
              //         child: Column(
              //           children: [
              //             Icon(
              //               Icons.description,
              //               color: Colors.orange,
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Pending',
              //               style: TextStyle(
              //                 color: Colors.orange,
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               '1',
              //               style: TextStyle(
              //                 color: Colors.orange,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //       borderRadius: BorderRadius.circular(10),
              //       onTap: () {},
              //       child: Container(
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           // color: Colors.green.shade100,
              //         ),
              //         child: Column(
              //           children: [
              //             Icon(
              //               Icons.stop_circle_outlined,
              //               color: Colors.red,
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Canceled',
              //               style: TextStyle(
              //                 color: Colors.red,
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               '1',
              //               style: TextStyle(
              //                 color: Colors.red,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //       borderRadius: BorderRadius.circular(10),
              //       onTap: () {},
              //       child: Container(
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           // color: Colors.green.shade100,
              //         ),
              //         child: Column(
              //           children: [
              //             Icon(
              //               Icons.shopping_cart,
              //               color: Colors.grey,
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'On delivery',
              //               style: TextStyle(
              //                 color: Colors.grey,
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               '1',
              //               style: TextStyle(
              //                 color: Colors.grey,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //       borderRadius: BorderRadius.circular(10),
              //       onTap: () {},
              //       child: Container(
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           // color: Colors.green.shade100,
              //         ),
              //         child: Column(
              //           children: [
              //             Icon(
              //               Icons.check,
              //               color: Colors.green,
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Delivered',
              //               style: TextStyle(
              //                 color: Colors.green,
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               '1',
              //               style: TextStyle(
              //                 color: Colors.green,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
          OrderDetail()
        ],
      ),
    );
  }
}
