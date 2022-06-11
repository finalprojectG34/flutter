import 'category.dart';

class Shop {
  const Shop(
      {this.id,
      this.name,
      this.count,
      this.description,
      this.ownerId,
      this.sellingCategories,
      this.poster,
      this.image,
      this.phoneNumber,
      this.slug,
      this.address});

  final String? id;
  final String? name;
  final String? slug;
  final String? phoneNumber;
  final int? count;
  final String? ownerId;
  final String? poster;
  final List<Category>? sellingCategories;
  final String? image;
  final String? description;
  final Address? address;

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      name: json['name'],
      slug: json["slug"],
      ownerId: json['ownerId'],
      image: json['image'],
      description: json['desc'],
      address:
          json["address"] != null ? Address.fromJson(json["address"]) : null,
      count: json["count"],
      phoneNumber: json["phoneNumber"],
      poster: json["poster"],
      sellingCategories: json["sellingCategories"] != null
          ? List.from(json["sellingCategories"])
              .map((e) => Category.fromJson(e))
              .toList()
          : null,
    );
  }
}

class Address {
  final String? addressName;
  final String? city;
  final String? subCity;

  Address({this.addressName, this.city, this.subCity});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        addressName: json["addressName"],
        city: json["city"],
        subCity: json["subCity"]);
  }
}
