import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

@immutable
class User extends Equatable {

  User(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.role,
      this.token,
      this.phone,
      this.password,
      this.profile});

  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;

  String? profile;
  final String? role;

  final String? image;

  String? token;

  // final []String categories;

  @override
  List<Object?> get props => [id, name, email, role, image, password, phone];

  factory User.fromJson(Map<String, dynamic> json) {
    // logTrace("inFactory");
    User item = User(
      id: json['_id'],
      name: json['username'],
      email: json['email'],

      role: json['role'],
      image: json['image'],
      token:json['token'],

      password: json['Password'],
      phone: json['phone'],

    );
    // logTrace("afterFactory", item);
    return item;
  }

  @override
  String toString() =>
      'User { id: $id, name: $name, email:$email, password: $password, phone: $phone }';
}
