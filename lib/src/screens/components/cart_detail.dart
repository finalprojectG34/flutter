import 'package:flutter/material.dart';

class CartDetail extends StatelessWidget {
  const CartDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Items (2)'),
                Text('ETB 46.22'),
              ],
            ),
            Row(
              children: const [
                Text('Shipping'),
                Text('ETB 50.22'),
              ],
            ),
            Row(
              children: const [
                Text('Total Price'),
                Text('ETB 150.22'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
