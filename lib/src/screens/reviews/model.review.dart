
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sms/src/utils/loger/console_loger.dart';

enum OnModel{
  ITEM,
  SHOP
}
class Review {
  final String? id;

  const Review(
      {
        required this.body,
        required this.rating,
        required this.onModel,
        required this.modelId,
        this.ownerId,
        this.miniUser,
        this.id,

        });
  final OnModel onModel;
  final String modelId;
  final String? ownerId;

  final MiniUser? miniUser;
  final double rating;
  final String body;





  factory Review.fromJson(Map<String, dynamic> json) {



    return Review(
      id: json['id'],
      onModel: json['onModel'],
      modelId: json['modelId'],

      rating: json["rating"],
      body: json['desc'],

      ownerId: json['ownerId'],
      miniUser:json["user"] != null ? MiniUser.fromJson(json["user"]) : null,
    );
  }
}

class MiniUser {
  final String? fullName;
  final String? poster;


  MiniUser({this.fullName, this.poster});

  factory MiniUser.fromJson(Map<String, dynamic> json) {
    return MiniUser(
        fullName: json["fullName"],
        poster: json["poster"],
       );
  }
}
