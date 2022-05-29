import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/components/single_cart.dart';

import '../components/payment_detail.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              clipBehavior: Clip.none,
              children: const [
                SingleCart(),
                SingleCart(),
                SingleCart(),
              ],
            ),
          ),

          const SizedBox(
            height: 50,
          ),

          const PaymentDetail(),


          ElevatedButton(
              style: ButtonStyle(
                shadowColor:
                MaterialStateProperty.all(Colors.lightBlueAccent),
                elevation: MaterialStateProperty.all(5),
                backgroundColor:
                MaterialStateProperty.all(const Color(0xff40BFFF)),
                fixedSize: MaterialStateProperty.all(Size(Get.width, 54)),
              ),
              onPressed: () {

              },
              child: const Text(
                "Check Out",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              )),
        ],
      ),
    );
  }
}
