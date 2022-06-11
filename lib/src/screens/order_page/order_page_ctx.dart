import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sms/src/models/models.dart';

import '../../../data/repository/order_repository.dart';
import '../../models/Order.dart';

class OrderPageController extends GetxController {
  final OrderRepository orderRepository;

  final storage = const FlutterSecureStorage();

  OrderPageController({required this.orderRepository});

  RxBool isCartFetchedFromDB = false.obs;
  RxBool isOrderLoading = false.obs;
  RxList<Order>? orderList = <Order>[].obs;
  Rx<Order> order = const Order().obs;

  RxString itemId = ''.obs;
  RxList attributes = [].obs;
  RxMap<String, String> selectedAttributes = <String, String>{}.obs;

  RxMap<String, dynamic>? mockCategory = <String, dynamic>{}.obs;
  RxInt categorySelectPages = 0.obs;
  RxBool isCategoryLoading = true.obs;
  List<String> tempCategories = [];
  RxList<String> selectedCategoryName = <String>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getOrder("PENDING");
  }

  getOrder(String status) async {
    isOrderLoading(true);
    List<Order> orders =  await orderRepository.getOrder(status);
    orderList!(orders);
    isOrderLoading(false);
  }

  getOrderById(String orderId) async {
    isOrderLoading(true);
    Order newOrder =  await orderRepository.getOrderById(orderId);
    order(newOrder);
    isOrderLoading(false);
  }

  updateOrderStatus(String orderId, String status) async {
    isOrderLoading(true);
    Order newOrder =  await orderRepository.updateOrderStatus(orderId, status);
    order(newOrder);
    isOrderLoading(false);
  }

  createOrder(List<Cart> carts) async {
    List<Order> orders = [];
    Map<String?, List<OrderItem>> orderItems = {};
    for (var cart in carts) {
      orderItems[cart.shopId] = [];
    }
    for (var cart in carts) {
      orderItems[cart.shopId]?.add(OrderItem(
        amount: cart.amount,
        id: cart.itemId,
        name: cart.name,
        price: cart.name,
      ));
    }
    orderItems.forEach((key, value) {
      Order order = Order(
        shopId: key,
        orderItems: value,
        actions: "actions",
        deliveryAddress: "deliveryAddress",
      );
      orders.add(order);
    });
    await orderRepository.createOrder(orders);
  }

  deleteOrder(cartId) async {}
}
