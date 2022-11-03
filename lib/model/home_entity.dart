// To parse this JSON data, do
//
//     final homeEntity = homeEntityFromJson(jsonString);

import 'dart:convert';

class HomeEntity {
  HomeEntity({
    this.status,
    this.users,
  });

  String? status;
  List<User>? users;

  factory HomeEntity.fromRawJson(String str) => HomeEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeEntity.fromJson(Map<String, dynamic> json) => HomeEntity(
    status: json["status"],
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "users": List<dynamic>.from(users!.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.id,
    this.title,
    this.description,
    this.image,
    this.category,
    this.createdAt,
    this.status,
  });

  String? id;
  String? title;
  String? description;
  String? image;
  String? category;
  DateTime? createdAt;
  String? status;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    category: json["category"],
    createdAt: DateTime.parse(json["created_at"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "category": category,
    "created_at": createdAt?.toIso8601String(),
    "status": status,
  };
}
