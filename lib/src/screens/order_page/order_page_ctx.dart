import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sms/src/models/models.dart';
import 'package:sms/src/screens/order_page/sent_orders_page.dart';
import 'package:sms/src/screens/shops_list/all_shops_list_ctx.dart';

import '../../../data/repository/order_repository.dart';
import '../../models/order.dart';

class OrderPageController extends GetxController {
  final OrderRepository orderRepository;

  final storage = Get.find<FlutterSecureStorage>();
  AllShopsListController shopsListController = Get.find();

  OrderPageController({required this.orderRepository});

  RxBool isOrderLoading = false.obs;
  RxBool isOrderError = false.obs;
  RxString orderErrorText = "".obs;
  RxList<Order>? orderList = <Order>[].obs;
  Rx<Order> order = const Order().obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getOrder(widget.status);
  // }

  getSentOrders(String status) async {
    isOrderLoading(true);
    try {
      List<Order> orders = await orderRepository.getOrder(status);
      orderList!(orders);
      print(orders);
    } catch (e) {
      print(e);
      isOrderError(true);
      orderErrorText("Error Happened");
    }
    isOrderLoading(false);
  }

  getReceivedOrders(String status) async {
    isOrderLoading(true);
    try {
      List<Order> orders = await orderRepository.getReceivedOrders(status);
      orderList!(orders);
      print(orders);
    } catch (e) {
      print(e);
      isOrderError(true);
      orderErrorText("Error Happened");
    }
    isOrderLoading(false);
  }

  getOrderById(String orderId) async {
    isOrderLoading(true);
    try {
      Order newOrder = await orderRepository.getOrderById(orderId);
      order(newOrder);
      isOrderError(false);
    } catch (e) {
      print(e);
      isOrderError(true);
      orderErrorText("Error Happened");
    }
    isOrderLoading(false);
  }

  updateOrderStatus(String orderId, String action) async {
    isOrderLoading(true);
    try {
      Order newOrder = await orderRepository.updateOrderStatus(orderId, action);
      order(newOrder);
    } catch (e) {
      print(e);
      isOrderError(true);
      orderErrorText("Error Happened");
    }
    isOrderLoading(false);
  }

  createOrder(List<Cart> carts, Address? address) async {
    isOrderLoading(true);
    List<Order> orders = [];
    Map<String?, List<OrderItem>> orderItems = {};
    for (var cart in carts) {
      orderItems[cart.shopId] = [];
    }
    for (var cart in carts) {
      orderItems[cart.shopId]?.add(OrderItem(
        amount: cart.amount,
        id: cart.id,
        name: cart.name,
        price: cart.name,
      ));
    }
    orderItems.forEach((key, value) {
      Order order = Order(
        shopId: key,
        orderItems: value,
        actions: "PlacedOrder",
        deliveryAddress: address,
      );
      orders.add(order);
    });
    try {
      await orderRepository.createOrder(orders);
      Get.to(() => SentOrdersPage());
    } catch (e) {
      isOrderError(true);
      orderErrorText("Error Happened");
    }
    isOrderLoading(false);
  }

  assignDelivery(String orderId, String shopId) async {
    isOrderLoading(true);
    try {
      Order newOrder = await orderRepository.assignDelivery(orderId, shopId);
      print(newOrder);
      order(newOrder);
      shopsListController.getShopById(newOrder.deliveryId!);
      Get.back();
    } catch (e) {
      print(e);
      isOrderError(true);
    }
    isOrderLoading(false);
  }

  removeDelivery(String orderId) async {
    isOrderLoading(true);
    try {
      Order newOrder = await orderRepository.removeDelivery(orderId);
      order(newOrder);
    } catch (e) {
      print(e);
      isOrderError(true);
    }
    isOrderLoading(false);
  }

  deleteOrder(cartId) async {}
}
