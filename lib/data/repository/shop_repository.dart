import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/src/models/shop.dart';

class ShopRepository {
  final GraphQLClient gqlClient;

  ShopRepository({required this.gqlClient});

  Future<List<Shop>> getShops(int pageSize, int pageIndex) async {
    // final response = await gqlClient.query(
    //   QueryOptions(document: gql(r'''
    //     query GetOrderByUserId($status: String) {
    //       getOrderByUserId(status: $status) {
    //         id
    //         status
    //         userId
    //         shopId
    //         orderItems {
    //           id
    //           name
    //           price
    //           amount
    //         }
    //         subTotal
    //       }
    //     }
    //   '''), variables: {"pageIndex": pageIndex, "pageSize": pageSize}),
    // );
    // List<Shop> newOrders = [];
    // if (response.hasException) {
    //   print(response.exception);
    // } else {
    //   print(response);
    //   for (var element in (response.data!["getOrderByUserId"] as List)) {
    //     newOrders.add(Shop.fromJson(element));
    //   }
    // }
    // return newOrders;
    return getMockShops();
  }

  Future<List<Shop>> getMockShops() {
    return Future.delayed(const Duration(seconds: 4), () {
      return List.generate(30, (i) {
        return Shop(
          id: "$i",
          phoneNumber: "+2519499494",
          image:
              "https://www.shutterstock.com/image-photo/young-student-watching-lesson-online-studying-1676998306",
          count: 4,
          name: "Shop $i",
          address: Address(addressName: "Jemo"),
          description: "Shop $i sells shoes",
        );
      });
    });
  }
}

final mockShop = Shop(
  id: "1",
  phoneNumber: "+2519499494",
  image:
      "https://www.shutterstock.com/image-photo/young-student-watching-lesson-online-studying-1676998306",
  count: 4,
  name: "Shop 1",
  address: Address(addressName: "Jemo"),
  description: "Shop 1 sells shoes",
);
