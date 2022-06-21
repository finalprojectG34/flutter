import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/helper/constance.dart';
import 'package:sms/src/models/cart.dart';

import '../cart_page/cart_page_ctx.dart';

class SingleCart extends StatefulWidget {
  const SingleCart({Key? key, required this.cart}) : super(key: key);

  final Cart cart;

  @override
  State<SingleCart> createState() => _SingleCartState();
}

class _SingleCartState extends State<SingleCart> {
  TextEditingController frequencyController = TextEditingController();
  final CartPageController cartPageController = Get.find();
  int frequency = 1;

  @override
  Widget build(BuildContext context) {
    frequencyController.text = '1';
    return Card(
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child:
                  // NetworkImage("widget.cart.image"),
                  Image.network(
                widget.cart.image ?? '',
                fit: BoxFit.fitHeight,
                height: 120,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.cart.name!,
                            maxLines: 3,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: color1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            cartPageController.deleteCart(widget.cart.id);
                          },
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ETB ${widget.cart.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        SizedBox(
                          width: 100,
                          height: 26,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    child: const Icon(
                                      Icons.remove,
                                    ),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    onPressed: () async {
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.zero,
                                    decoration: const BoxDecoration(
                                      color: color2,
                                    ),
                                    child: Text(
                                      '$frequency',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  // flex: 2,
                                  child: TextButton(
                                    child: const Center(
                                      child: Icon(Icons.add),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.zero),
                                    onPressed: () {
                                      setState(() {
                                        frequencyController.text =
                                            '${frequency++}';
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
