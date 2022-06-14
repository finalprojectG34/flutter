import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.image,
      this.role,
      this.token,
      this.phone,
      this.password,
      this.profile,
      this.shopId});

  final String? id;
  final String? shopId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? password;

  String? profile;
  final String? role;

  final String? image;

  String? token;

  // final []String categories;

  @override
  List<Object?> get props =>
      [id, firstName, email, role, image, password, phone];

  factory User.fromJson(Map<String, dynamic> json, {String? token}) {
    // logTrace("inFactory");
    User item = User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      role: json['role'],
      image: json['image'],
      token: token,
      password: json['password'],
      phone: json['phone'],
        shopId: json['shopId']);
    // logTrace("afterFactory", item);
    return item;
  }

  @override
  String toString() =>
      'User { id: $id, name: $firstName, email:$email, password: $password, phone: $phone }';
}
