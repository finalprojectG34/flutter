import 'package:graphql_flutter/graphql_flutter.dart';

import '../../src/models/Order.dart';

class OrderRepository {
  final GraphQLClient gqlClient;

  OrderRepository({required this.gqlClient});

  Future<List<Order>> getOrder(String status) async {
    String getOrderByUserId = r'''
        query GetOrderByUserId($status: String) {
          getOrderByUserId(status: $status) {
            id
            status
            userId
            shopId
            createdAt
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
      ''';
    final response = await gqlClient.query(
      QueryOptions(
        document: gql(getOrderByUserId),
        variables: {"status": status},
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    List<Order> newOrders = [];
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    } else {
      print(response);
      for (var element in (response.data!["getOrderByUserId"] as List)) {
        print(element);
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
            createdAt
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
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
    Order newOrder = Order.fromJson(response.data!["getOneOrder"]);
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
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
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
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
    Order newOrder = Order.fromJson(response.data!["getOneOrder"]);
    return newOrder;
  }

  Future deleteOrder(String orderId) async {
    final response = await gqlClient.mutate(MutationOptions(
      document: gql(r'''
            mutation Mutation($deleteCartId: ID!) {
              deleteCart(id: $deleteCartId) {
                id
              }
            }
      '''),
      variables: {"deleteCartId": orderId},
      fetchPolicy: FetchPolicy.noCache,
    ));
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
  }
}
