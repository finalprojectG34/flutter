import 'package:sms/src/app.dart';

class Order {
  const Order({
    this.id,
    this.status,
    this.userId,
    this.shopId,
    this.orderItems,
    this.subTotal,
    this.actions,
    this.deliveryAddress,
  });

  final String? id;
  final String? status;
  final String? userId;
  final String? shopId;
  final List<OrderItem>? orderItems;
  final String? subTotal;
  final String? actions;
  final Address? deliveryAddress;

  factory Order.fromJson(Map<String, dynamic> json) {
    Order item = Order(
      id: json['id'],
      status: json['status'],
      userId: json['userId'],
      shopId: json['shopId'],
      orderItems: (json['orderItems'] != null) ? (json['orderItems'] as List)
          .map((e) => OrderItem.fromJson(e))
          .toList() : [],
      subTotal: (json['subTotal'] != null) ? json['subTotal'].toString() : "",
      actions: json['actions'],
      deliveryAddress: (json['deliveryAddress'] != null) ? Address.fromJson(json['deliveryAddress']) : Address(),
    );
    return item;
  }

  @override
  String toString() {
    return '{id: $id status: $status userId: $userId}';
  }
}

class OrderItem {
  const OrderItem({
    this.id,
    this.name,
    this.price,
    this.amount,
  });

  final String? id;
  final String? name;
  final String? price;
  final String? amount;

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    OrderItem item = OrderItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      amount: json['amount'],
    );
    return item;
  }

  @override
  String toString() {
    return '{id: $id name: $name, price: $price, amountL $amount }';
  }
}
