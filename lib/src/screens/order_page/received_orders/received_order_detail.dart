import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/order_page/order_page_ctx.dart';
import 'package:sms/src/screens/order_page/received_orders/search_delivery.dart';

import '../../shops_list/all_shops_list_ctx.dart';
import '../sent_orders/sent_order_detail.dart';

class ReceivedOrderDetail extends StatefulWidget {
  final String orderId;

  const ReceivedOrderDetail({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<ReceivedOrderDetail> createState() => _ReceivedOrderDetailState();
}

class _ReceivedOrderDetailState extends State<ReceivedOrderDetail> {
  OrderPageController orderPageController = Get.find();
  AllShopsListController shopsListController = Get.find();

  @override
  void initState() {
    orderPageController.getOrderById(widget.orderId);
  }

  static const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<OrderPageController>(
      builder: (ctx) {
        return ctx.isOrderLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : ctx.isOrderError.isTrue
                ? Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${ctx.orderErrorText}"),
                      TextButton(
                        onPressed: () {
                          ctx.getOrderById(widget.orderId);
                        },
                        child: Text("Retry!"),
                      ),
                    ],
                  ))
                : RefreshIndicator(
                    onRefresh: () async {
                      await orderPageController.getOrderById(widget.orderId);
                    },
                    child: Scaffold(
                      appBar: AppBar(title: Text('Order')),
                      body: ListView(
                        children: [
                          SizedBox(height: 10),
                          OrderInfo(ctx),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        isDismissible: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                        context: context,
                                        builder: (context) => Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Order Tracker",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: DeliveryProcesses(
                                                    orderActions: ctx.order
                                                        .value.sellerActions!,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text("Order Tracking")),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          if (ctx.order.value.status == "PENDING")
                            AcceptReject(ctx),
                          if (ctx.order.value.status == "ACCEPTED" ||
                              ctx.order.value.status == "REQUESTED")
                            AssignDelivery(ctx)
                        ],
                      ),
                    ),
                  );
      },
    );
  }

  AcceptReject(OrderPageController ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                ctx.updateOrderStatus(
                  ctx.order.value.id!,
                  "DeclinedBySeller",
                );
              },
              child: const Text(
                "Reject",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () async {
                ctx.updateOrderStatus(
                  ctx.order.value.id!,
                  "AcceptedBySeller",
                );
              },
              child: const Text(
                "Accept",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  OrderInfo(OrderPageController ctx) {
    DateTime getDate(String date) {
      return DateTime.parse(date);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        color: Colors.blue.shade300,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'ETB 300',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Items',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${ctx.order.value.orderItems?.length}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "${getDate(ctx.order.value.createdAt!).day} ${months[getDate(ctx.order.value.createdAt!).month]}, ${getDate(ctx.order.value.createdAt!).year}: ${getDate(ctx.order.value.createdAt!).hour}:${getDate(ctx.order.value.createdAt!).minute}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  AssignDelivery(OrderPageController ctx) {
    return ctx.order.value.deliveryId == ""
        ? Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery not assigned",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => SearchDelivery(orderId: ctx.order.value.id!));
                  },
                  child: Text("Assign"),
                ),
              ],
            ),
          )
        : DeliveryProfile(
            shopId: ctx.order.value.deliveryId!, orderId: ctx.order.value.id!);
  }
}

class DeliveryProfile extends StatefulWidget {
  final String shopId;
  final String orderId;

  const DeliveryProfile({Key? key, required this.shopId, required this.orderId})
      : super(key: key);

  @override
  State<DeliveryProfile> createState() => _DeliveryProfileState();
}

class _DeliveryProfileState extends State<DeliveryProfile> {
  OrderPageController orderPageController = Get.find();

  @override
  void initState() {
    AllShopsListController shopsListController = Get.find();
    shopsListController.getShopById(widget.shopId);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AllShopsListController>(
      builder: (ctx) {
        return ctx.isLoading.isTrue || orderPageController.isOrderLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ctx.errorOccurred.isTrue ||
                    orderPageController.isOrderError.isTrue
                ? Text("Error Happened")
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://www.woolha.com/media/2020/03/eevee.png'),
                                radius: 25,
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${ctx.shop.value.name}'),
                                Text('${ctx.shop.value.phoneNumber}'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.green,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 3,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text('${ctx.shop.value.address?.country}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.green,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 3,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text('${ctx.shop.value.address?.city}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.green,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 3,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                        '${ctx.shop.value.address?.subCity} ${ctx.shop.value.address?.addressName}'),
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                orderPageController
                                    .removeDelivery(widget.orderId);
                              },
                              child: Text("Cancel"),
                            )
                          ],
                        )
                      ],
                    ),
                  );
      },
    );
  }
}
