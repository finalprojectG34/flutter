import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/screens/home_page/AppCtx.dart';

import '../../../models/item.dart';
import 'add_to_cart_ctx.dart';

class ItemMiniDetail extends StatelessWidget {
  final Item item;

  ItemMiniDetail({Key? key, required this.item}) : super(key: key);
  final AppController appController = Get.find();
  final AddToCartController addToCartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.9),
                        BlendMode.dstATop,
                      ),
                      image: const NetworkImage(
                          "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 12,
                  ),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 8.0, top: 8),
                //       child: IconButton(
                //         padding: EdgeInsets.zero,
                //         constraints: const BoxConstraints(),
                //         splashRadius: 10,
                //         onPressed: () {},
                //         icon: const Icon(
                //           Icons.favorite_border_rounded,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(right: 8.0),
                //       child: Container(
                //         decoration: const BoxDecoration(
                //           color: Colors.white,
                //           shape: BoxShape.circle,
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey,
                //               offset: Offset(
                //                 2.0,
                //                 2.0,
                //               ),
                //               blurRadius: 5.0,
                //               spreadRadius: 2.0,
                //             ), //BoxShadow
                //             BoxShadow(
                //               color: Colors.white,
                //               offset: Offset(0.0, 0.0),
                //               blurRadius: 0.0,
                //               spreadRadius: 0.0,
                //             ),
                //           ],
                //         ),
                //         transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                //         child: Padding(
                //           padding: const EdgeInsets.all(2.0),
                //           child: IconButton(
                //             padding: EdgeInsets.zero,
                //             constraints: const BoxConstraints(),
                //             splashRadius: 10,
                //             onPressed: () {},
                //             icon: const Icon(
                //               Icons.remove_red_eye,
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Column(
                  children: [
                    // Text(
                    //   item.id!,
                    //   style: TextStyle(color: Colors.grey),
                    // ),
                    Text(
                      item.name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(12)',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          '\$600',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${item.price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.blue,
                  ),
                ),
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  //name, shopId, userId, itemId, price, amount
                  addToCartController.addToCart(
                      item.name, item.id, item.id, item.price, "1");
                  // appController.changePage('Cart', 3);
                },
              ),
            ),
          ),
          // Align(
          //     child: ElevatedButton(
          //   onPressed: () {
          //     addToCartController.addToCart(
          //         item.name, item.id, item.id, item.id, item.price, "1");
          //   },
          //   child: Text('Add to cart'),
          //   style: ElevatedButton.styleFrom(
          //     minimumSize: Size(0, 0),
          //   ),
          // ))
        ],
      ),
    );
  }
}
