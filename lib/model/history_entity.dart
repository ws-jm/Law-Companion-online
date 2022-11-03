// To parse this JSON data, do
//
//     final historyEntity = historyEntityFromJson(jsonString);

import 'dart:convert';

class HistoryEntity {
  HistoryEntity({
    this.status,
    this.users,
  });

  String? status;
  List<User>? users;

  factory HistoryEntity.fromRawJson(String str) => HistoryEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryEntity.fromJson(Map<String, dynamic> json) => HistoryEntity(
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
    this.userId,
    this.searchText,
    this.date,
    this.status,
  });

  String? id;
  String? userId;
  String? searchText;
  DateTime? date;
  String? status;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userId: json["user_id"],
    searchText: json["search_text"],
    date: DateTime.parse(json["date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "search_text": searchText,
    "date": date!.toIso8601String(),
    "status": status,
  };
}
