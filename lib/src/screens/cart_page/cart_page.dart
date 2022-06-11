import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/components/single_cart.dart';

import '../../models/cart.dart';
import '../components/payment_detail.dart';
import 'cart_page_ctx.dart';
import '../order_page/order_page_ctx.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  void initState() {
    super.initState();
  }

  final OrderPageController orderPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX<CartPageController>(
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ctx.isCartLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : ctx.errOccurred.isTrue
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(ctx.err.value),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  ctx.getCart();
                                },
                                child: Text('Retry'))
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView(
                            clipBehavior: Clip.none,
                            children: (ctx.cartList as List)
                                .map((cart) => SingleCart(cart: cart))
                                .toList()
                                .obs,
                          ),
                        ),
                        const SizedBox(height: 50),
                    const PaymentDetail(),
                    ElevatedButton(
                      style: ButtonStyle(
                        shadowColor:
                            MaterialStateProperty.all(Colors.lightBlueAccent),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff40BFFF)),
                        fixedSize:
                            MaterialStateProperty.all(Size(Get.width, 54)),
                      ),
                      onPressed: () {
                        List<Cart> tempCart = [];
                        ctx.cartList?.toList().forEach((element) {
                          tempCart.add(element);
                        });
                        orderPageController.createOrder(tempCart);
                      },
                      child: const Text(
                        "Check Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
