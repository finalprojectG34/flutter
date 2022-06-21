import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/screens/cart_page/cart_page_ctx.dart';
import 'package:sms/src/screens/home_page/AppCtx.dart';
import 'package:sms/src/screens/home_page/item_detail/item_detail.dart';

import '../../../models/cart.dart';
import '../../../models/item.dart';

class ItemMiniDetail extends StatefulWidget {
  final Item item;

  const ItemMiniDetail({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemMiniDetail> createState() => _ItemMiniDetailState();
}

class _ItemMiniDetailState extends State<ItemMiniDetail> {
  bool isCartLoading = false;
  final AppController appController = Get.find();
  final CartPageController addToCartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ItemDetails(
          item: widget.item,
        ));
      },
      child: Card(
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
                          image: NetworkImage(widget.item.imagePath!),
                          // "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
                          onError: (e, s) {}),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Row(
                  //   children: const [
                  //     Icon(
                  //       Icons.star,
                  //       size: 16,
                  //       color: Colors.amber,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       size: 16,
                  //       color: Colors.amber,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       size: 16,
                  //       color: Colors.amber,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       size: 16,
                  //       color: Colors.amber,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       size: 16,
                  //       color: Colors.amber,
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     Text(
                  //       '(12)',
                  //       style: TextStyle(color: Colors.grey),
                  //     )
                  //   ],
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "${widget.item.discountPrice}",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${widget.item.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const Spacer(),
                      isCartLoading
                          ? CircularProgressIndicator()
                          : InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.blue,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(50),
                              onTap: () async {
                                setState(() {
                                  isCartLoading = true;
                                });
                                await addToCartController.addToCart(Cart(
                                  name: widget.item.name,
                                  shopId: widget.item.shopId,
                                  id: widget.item.id,
                                  price: widget.item.price?.toString(),
                                  amount: "1",
                                ));
                                setState(() {
                                  isCartLoading = false;
                                });
                                // appController.changePage('Cart', 3);
                              },
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
