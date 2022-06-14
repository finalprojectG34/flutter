import 'package:graphql_flutter/graphql_flutter.dart';

import '../../src/models/Order.dart';

class OrderRepository {
  final GraphQLClient gqlClient;

  OrderRepository({required this.gqlClient});

  Future<List<Order>> getOrder(String status) async {
    final response = await gqlClient.query(
      QueryOptions(
        document: gql(r'''
        query GetOrderByUserId($status: String) {
          getOrderByUserId(status: $status) {
            id
            status
            userId
            shopId
            orderItems {
              id
              name
              price
              amount
            }
            subTotal
            deliveryAddress {
              addressName
              city
              subCity
              country
            }
          }
        }
      '''),
        variables: {"status": status},
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    List<Order> newOrders = [];
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    } else {
      print(response);
      for (var element in (response.data!["getOrderByUserId"] as List)) {
        newOrders.add(Order.fromJson(element));
      }
    }
    return newOrders;
  }

  Future<Order> getOrderById(String orderId) async {
    final response = await gqlClient.query(
      QueryOptions(document: gql(r'''
        query GetOneOrder($getOneOrderId: String!) {
          getOneOrder(id: $getOneOrderId) {
            id
            status
            userId
            shopId
            orderItems {
              id
              name
              price
              amount
            }
            subTotal
            deliveryAddress {
              subCity
              city
              addressName
              country
            }
          }
        }
      '''), variables: {"getOneOrderId": orderId}),
    );
    Order newOrder = const Order();
    if (response.hasException) {
      print(response.exception);
    } else {
      print(response);
      newOrder = Order.fromJson(response.data!["getOneOrder"]);
    }
    return newOrder;
  }

  Future<List<Order>> createOrder(List<Order> orders) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
        mutation CreateManyOrders($input: [OrderCreateInput!]!) {
          createManyOrders(input: $input) {
            id
          }
        }
      '''),
      variables: {
        "input": orders
            .map((order) => {
                  "name": "name",
                  "description": "description",
                  "shopId": order.shopId,
                  "deliveryAddress": {
                    "subCity": order.deliveryAddress?.subCity,
                    "city": order.deliveryAddress?.city,
                    "addressName": order.deliveryAddress?.addressName,
                    "country": order.deliveryAddress?.country,
                  },
                  "orderItems": order.orderItems
                      ?.map((orderItem) => {
                            "id": orderItem.id,
                            "name": orderItem.name,
                            "price": orderItem.price,
                            "amount": orderItem.amount,
                          })
                      .toList()
                })
            .toList(),
      },
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    if (response.hasException) {
      print(response.exception);
    }
    print(response);
    List<Order> newOrders = [];
    for (var element in (response.data!["createManyOrders"] as List)) {
      newOrders.add(Order.fromJson(element));
    }
    return newOrders;
  }

  Future<Order> updateOrderStatus(String orderId, String status) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation Mutation($updateOrderStatusId: String, $status: OrderStatus!) {
              updateOrderStatus(id: $updateOrderStatusId, status: $status) {
                id
                status
                userId
                shopId
                subTotal
                orderItems {
                  price
                  id
                  name
                  amount
                }
              }
            }
      '''),
      variables: {"updateOrderStatusId": orderId, "status": status},
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    Order newOrder = const Order();
    if (response.hasException) {
      print(response.exception);
    } else {
      print(response);
      newOrder = Order.fromJson(response.data!["getOneOrder"]);
    }
    return newOrder;
  }

  Future deleteOrder(cartId) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation Mutation($deleteCartId: ID!) {
              deleteCart(id: $deleteCartId) {
                id
              }
            }
      '''),
      variables: {"deleteCartId": cartId},
      fetchPolicy: FetchPolicy.networkOnly,
    ));
    if (response.hasException) {
      // throw response.exception;
    } else {}
  }
}
