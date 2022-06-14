

class Review {
  final String? id;

  const Review(
      {this.id,
        this.onModel,
        this.modelId,

        this.ownerId,
        this.miniUser,
        this.body,
        this.rating



        });
  final String? onModel;
  final String? modelId;
  final String? ownerId;

  final MiniUser? miniUser;
  final double? rating;
  final String? body;




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
