import 'package:flutter/material.dart';

import '../../../helper/constance.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Items (2)',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'ETB 46.22',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Shipping',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  'ETB 50.22',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total Price',
                  style: TextStyle(
                      color: color1, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'ETB 150.22',
                  style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
