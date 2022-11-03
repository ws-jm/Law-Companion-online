// To parse this JSON data, do
//
//     final badgeEntity = badgeEntityFromJson(jsonString);

import 'dart:convert';

class BadgeEntity {
  BadgeEntity({
    this.status,
    this.news,
  });

  String? status;
  List<News>? news;

  factory BadgeEntity.fromRawJson(String str) => BadgeEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BadgeEntity.fromJson(Map<String, dynamic> json) => BadgeEntity(
    status: json["status"],
    news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "news": List<dynamic>.from(news!.map((x) => x.toJson())),
  };
}

class News {
  News({
    this.id,
    this.name,
    this.src,
    this.status,
    this.userPoint,
    this.packagePoint,
  });

  String? id;
  String? name;
  String? src;
  String? status;
  var userPoint;
  String? packagePoint;

  factory News.fromRawJson(String str) => News.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    name: json["name"],
    src: json["src"],
    status: json["status"],
    userPoint: json["user_point"],
    packagePoint: json["package_point"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "src": src,
    "status": status,
    "user_point": userPoint,
    "package_point": packagePoint,
  };
}
