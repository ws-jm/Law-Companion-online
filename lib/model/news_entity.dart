// To parse this JSON data, do
//
//     final newsEntity = newsEntityFromJson(jsonString);

import 'dart:convert';

class NewsEntity {
  NewsEntity({
    this.status,
    this.news,
  });

  String? status;
  List<News>? news;

  factory NewsEntity.fromRawJson(String str) => NewsEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsEntity.fromJson(Map<String, dynamic> json) => NewsEntity(
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
    this.title,
    this.content,
    this.postedOn,
    this.author,
  });

  String? id;
  String? title;
  String? content;
  DateTime? postedOn;
  String? author;

  factory News.fromRawJson(String str) => News.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    postedOn: DateTime.parse(json["posted_on"]),
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "posted_on": postedOn?.toIso8601String(),
    "author": author,
  };
}
