import 'package:flutter/material.dart';
import 'package:sms/src/screens/components/cart_detail.dart';
import 'package:sms/src/screens/components/single_cart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleCart(),
        CartDetail(),
        OutlinedButton(onPressed: () {}, child: Text('Check Out'))
      ],
    );
  }
}
