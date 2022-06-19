import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sms/src/models/shop.dart';

import '../../src/models/models.dart';
import '../../src/models/user.dart';

class ShopRepository {
  final GraphQLClient gqlClient;

  ShopRepository({required this.gqlClient});

  Future<List<Shop>> getShops() async {
    String getAllCompanies = r'''
      query GetAllCompanies {
            getAllCompanies {
              id
              slug
              name
              description
              phoneNumber
              tinNumber
              address {
                location {
                  coordinates
                }
                subCity
                city
                addressName
                country
              }
              image {
                imagePath
              }
              poster
              ownerId
              haveLicense
              status
              sellingCategories{
                id
                name
                image{
                imagePath
                imageCover
              }
              count
              
            }
          }}
      ''';
    final response = await gqlClient.query(
      QueryOptions(
        document: gql(getAllCompanies),
        // variables: {
        //   "input": {"role": role, "status": "Verified"}
        // },
        fetchPolicy: FetchPolicy.noCache,
      ),
    );

    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened ${response.exception}");
    } else {
      return (response.data!['getAllCompanies'] as List)
          .map((json) => Shop.fromJson(json))
          .toList();
    }
    // print("shops length");
    // print("${shops.length}");
    // return shops;
    //
    // // return getMockShops();
  }

  Future<List<Shop>> getShopByRole(String role) async {
    String getAllCompanies = r'''
        query GetAllCompanies($input: CompanyFilter) {
          getAllCompanies(input: $input) {
            id
            name
            description
            phoneNumber
            image {
              bgImage
              imageCover
            }
            tinNumber
            address {
              subCity
              city
              addressName
              country
            }
            ownerId
            status
            role
          }
        }
      ''';
    final response = await gqlClient.query(
      QueryOptions(
        document: gql(getAllCompanies),
        variables: {
          "input": {"role": role, "status": "Verified"}
        },
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    List<Shop> shops = [];
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    } else {
      print(response);
      for (var element in (response.data!["getAllCompanies"] as List)) {
        print(element);
        shops.add(Shop.fromJson(element));
      }
    }
    return shops;
  }

  Future<List<Shop>> getMockShops() {
    return Future.delayed(const Duration(seconds: 4), () {
      return List.generate(30, (i) {
        return Shop(
          id: "$i",
          phoneNumber: "+2519499494",
          image: ImageModel(
              imagePath:
                  "https://www.shutterstock.com/image-photo/young-student-watching-lesson-online-studying-1676998306"),
          name: "Shop $i",
          address: Address(addressName: "Jemo"),
          description: "Shop $i sells shoes",
        );
      });
    });
  }

  Future<Shop> getShopById(String shopId) async {
    String orderAction = r'''
       query Query($getOneCompanyId: String!) {
        getOneCompany(id: $getOneCompanyId) {
            id
            name
            description
            phoneNumber
            image {
              bgImage
              imageCover
            }
            tinNumber
            address {
              subCity
              city
              addressName
              country
            }
            ownerId
            status
            role
          }
        }
      ''';
    final response = await gqlClient.query(
      QueryOptions(
        document: gql(orderAction),
        variables: {"getOneCompanyId": shopId},
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    if (response.hasException) {
      print(response.exception);
      throw Exception("Error Happened");
    }
    print(response);
    return Shop.fromJson(response.data!["getOneCompany"]);
  }
}

final mockShop = Shop(
  id: "1",
  phoneNumber: "+2519499494",
  image: ImageModel(
      imagePath:
          "https://www.shutterstock.com/image-photo/young-student-watching-lesson-online-studying-1676998306"),
  name: "Shop 1",
  address: Address(addressName: "Jemo"),
  description: "Shop 1 sells shoes",
);
