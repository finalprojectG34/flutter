import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/models/order.dart';
import 'package:sms/src/screens/order_page/order_page_ctx.dart';
import 'package:timelines/timelines.dart';

class SentOrderDetail extends StatefulWidget {
  final String orderId;

  const SentOrderDetail({Key? key, required this.orderId}) : super(key: key);

  @override
  State<SentOrderDetail> createState() => _SentOrderDetailState();
}

class _SentOrderDetailState extends State<SentOrderDetail> {
  @override
  void initState() {
    OrderPageController orderPageController = Get.find();
    orderPageController.getOrderById(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Order'),
      ),
      body: GetX<OrderPageController>(
        builder: (ctx) {
          return ctx.isOrderLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : ctx.isOrderError.isTrue
                  ? Text("${ctx.orderErrorText}")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final data = _data(index + 1);
                        return Center(
                          child: Card(
                            margin: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: _OrderTitle(orderInfo: data),
                                ),
                                SimpleOrderDetail(order: ctx.order.value),
                                const Divider(height: 1.0),
                                _DeliveryProcesses(
                                  orderActions: ctx.order.value.orderActions!,
                                ),
                                const Divider(height: 1.0),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 1,
                    );
        },
      ),
    );
  }

  SimpleOrderDetail({required Order order}) {
    const months = [
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
    DateTime getDate(String date) {
      return DateTime.parse(date);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Order Id:"), Text("${order.id}")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Status:"), Text("${order.status}")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Created At:"),
              Text(
                  "${getDate(order.createdAt!).day} ${months[getDate(order.createdAt!).month]}, ${getDate(order.createdAt!).year}")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ordered Items:"),
              Text("${order.orderItems?.length}")
            ],
          ),
        ],
      ),
    );
  }
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key? key,
    required this.orderInfo,
  }) : super(key: key);

  final _OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Delivery #${orderInfo.id}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          style: const TextStyle(
            color: Color(0xffb6b2b2),
          ),
        ),
      ],
    );
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == 2;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: FixedTimeline.tileBuilder(
        verticalDirection: VerticalDirection.up,
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                thickness: 1.0,
              ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                size: 10.0,
                position: 0.5,
              ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
              !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(message),
            );
          },
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: 2,
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.orderActions})
      : super(key: key);

  final List<OrderAction> orderActions;

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
      return DateTime.fromMillisecondsSinceEpoch(int.parse(date));
    }

    return DefaultTextStyle(
      style: const TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          verticalDirection: VerticalDirection.up,
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Colors.blue,
            indicatorTheme: const IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: const ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            itemCount: orderActions.length,
            contentsBuilder: (_, index) {
              // if (orderActions[index].isHidden) {
              //   return null;
              // }
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${orderActions[index].type}",
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    Card(
                      color: Colors.green.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _InnerTimeline(
                                message: orderActions[index].messages!),
                            _InnerTimeline(
                              message:
                                  "${getDate(orderActions[index].date!).day} ${months[getDate(orderActions[index].date!).month]}, ${getDate(orderActions[index].date!).year}: ${getDate(orderActions[index].date!).hour}:${getDate(orderActions[index].date!).minute}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              // if(processes[index].isHidden){
              //   return null;
              // }
              if ("${orderActions[index].type}" == "PlacedOrder") {
                return const DotIndicator(
                  color: Color(0xff66c97f),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.0,
                  ),
                );
              } else {
                return const OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: "${orderActions[index].type}" == "PlacedOrder"
                  ? Colors.blue
                  : Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

class _OnTimeBar extends StatelessWidget {
  const _OnTimeBar({Key? key, required this.driver}) : super(key: key);

  final _DriverInfo driver;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('On-time!'),
              ),
            );
          },
          elevation: 0,
          shape: const StadiumBorder(),
          color: const Color(0xff66c97f),
          textColor: Colors.white,
          child: const Text('On-time'),
        ),
        const Spacer(),
        Text(
          'Driver\n${driver.name}',
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 12.0),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                driver.thumbnailUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

_OrderInfo _data(int id) => _OrderInfo(
      id: id,
      date: DateTime.now(),
      driverInfo: const _DriverInfo(
        name: 'Philipe',
        thumbnailUrl:
            'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
      ),
      deliveryProcesses: const [
        _DeliveryProcess(
          'Package Process',
          messages: [
            _DeliveryMessage('8:30am', 'Package received by driver'),
            _DeliveryMessage('11:30am', 'Reached halfway mark'),
          ],
        ),
        _DeliveryProcess(
          'In Transit',
          messages: [
            _DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            _DeliveryMessage('11:35am', 'Package delivered by Yonathan'),
          ],
        ),
        _DeliveryProcess(
          'In Transit',
          isFinal: true,
          messages: [
            _DeliveryMessage('13:00pm', 'Driver arrived at destination'),
            _DeliveryMessage('11:35am', 'Package delivered by Yonathan'),
          ],
        ),
        _DeliveryProcess.complete(),
      ],
    );

class _OrderInfo {
  const _OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final _DriverInfo driverInfo;
  final List<_DeliveryProcess> deliveryProcesses;
}

class _DriverInfo {
  const _DriverInfo({
    required this.name,
    required this.thumbnailUrl,
  });

  final String name;
  final String thumbnailUrl;
}

class _DeliveryProcess {
  const _DeliveryProcess(this.name,
      {this.messages = const [], this.isFinal = false});

  const _DeliveryProcess.complete()
      : name = '___Done___',
        messages = const [],
        isFinal = true;

  final String name;
  final List<_DeliveryMessage> messages;
  final bool isFinal;

  bool get isCompleted => isFinal;

  bool get isHidden => name == '___Done___';
}

class _DeliveryMessage {
  const _DeliveryMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}
