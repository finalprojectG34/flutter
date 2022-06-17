import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Order.dart';

class SingleOrder extends StatelessWidget {
  final Order order;

  const SingleOrder({Key? key, required this.order}) : super(key: key);

  static const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(int.parse(order.createdAt!));
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${order.id}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 5),
          Text(
            'Order date:  ${date.day} ${months[date.month]}, ${date.year}',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order status',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text('${order.status}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey))
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text('${order.orderItems?.length.toString()}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'price',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text('ETB 299',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}
