import 'package:flutter/material.dart';
import 'package:sms/src/screens/components/single_cart.dart';

import '../components/payment_detail.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleCart(),
        PaymentDetail(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: OutlinedButton(onPressed: () {}, child: Text('Check Out')),
        )
      ],
    );
  }
}
