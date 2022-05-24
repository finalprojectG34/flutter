import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'order id',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Order date:  august 19',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order status',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text('shipping',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text('2',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 5,
          ),
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
