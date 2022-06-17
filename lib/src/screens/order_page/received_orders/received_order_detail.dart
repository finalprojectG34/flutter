import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/order_page/order_page_ctx.dart';

class ReceivedOrderDetail extends StatefulWidget {
  final String orderId;

  const ReceivedOrderDetail({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<ReceivedOrderDetail> createState() => _ReceivedOrderDetailState();
}

class _ReceivedOrderDetailState extends State<ReceivedOrderDetail> {
  @override
  void initState() {
    OrderPageController orderPageController = Get.find();
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
    DateTime getDate(String date) {
      return DateTime.parse(date);
    }

    return GetX<OrderPageController>(
      builder: (ctx) {
        return ctx.isOrderLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : ctx.isOrderError.isTrue
                ? Text("${ctx.orderErrorText}")
                : Scaffold(
                    appBar: AppBar(title: Text('Order')),
                    body: ListView(
                      children: [
                        SizedBox(height: 10),
                        Padding(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Divider(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                        ),
                        SizedBox(height: 20),
                        Padding(
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
                        )
                      ],
                    ),
                  );
      },
    );
  }
}

// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Column(
// children: [
// Row(
// children: [
// CircleAvatar(
// radius: 25,
// child: CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://www.woolha.com/media/2020/03/eevee.png'),
// radius: 25,
// ),
// ),
// SizedBox(
// width: 20,
// ),
// Text('Delivery man name')
// ],
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// CircleAvatar(
// radius: 6,
// backgroundColor: Colors.green,
// child: CircleAvatar(
// backgroundColor: Colors.white,
// radius: 3,
// ),
// ),
// SizedBox(
// width: 5,
// ),
// Text('address 1 comes here'),
// ],
// ),
// Row(
// children: [
// CircleAvatar(
// radius: 6,
// backgroundColor: Colors.green,
// child: CircleAvatar(
// backgroundColor: Colors.white,
// radius: 3,
// ),
// ),
// SizedBox(
// width: 5,
// ),
// Text('address 2 comes here'),
// ],
// ),
// ],
// ),
// InkWell(
// child: Container(
// child: Icon(
// Icons.call,
// color: Colors.white,
// ),
// padding: const EdgeInsets.all(8),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(100),
// color: Colors.blue,
// // border: Border.all(color: Colors.grey),
// ),
// ),
// borderRadius: BorderRadius.circular(50),
// onTap: () {},
// )
// ],
// )
// ],
// ),
// ),
