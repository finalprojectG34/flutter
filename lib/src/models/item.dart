import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

@immutable
class Item extends Equatable {
  Item({this.id, @required this.name, @required this.price, this.category, this.imagePath, this.description});

  final String id;
  final String name;
  final String price;
  final String category;
  final String imagePath;
  final String description;


  // final []String categories;

  @override
  List<Object> get props => [id, name, price, category, imagePath, description];

  factory Item.fromJson(Map<String, dynamic> json) {
    // logTrace("inFactory", json);
    Item item =Item(
      id: json['id'],
      name: json['name'],
      price: json['price'].toString(),
      category: json['category'],
      imagePath: json['image'],
    );
    // logTrace("afterFactory", item);
    return item;
  }

  @override
  String toString() => 'Item { id: $id, name: $name, price:$price, image: $imagePath }';
}
