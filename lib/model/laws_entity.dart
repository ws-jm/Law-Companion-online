// To parse this JSON data, do
//
//     final lawsEntity = lawsEntityFromJson(jsonString);

import 'dart:convert';

class LawsEntity {
  LawsEntity({
    this.status,
    this.laws,
  });

  String? status;
  List<Law>? laws;

  factory LawsEntity.fromRawJson(String str) => LawsEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LawsEntity.fromJson(Map<String, dynamic> json) => LawsEntity(
    status: json["status"],
    laws: List<Law>.from(json["laws"].map((x) => Law.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "laws": List<dynamic>.from(laws!.map((x) => x.toJson())),
  };
}

class Law {
  Law({
    this.id,
    this.url,
    this.laws,
    this.section,
    this.chapter,
  });

  String? id;
  String? url;
  String? laws;
  String? section;
  String? chapter;

  factory Law.fromRawJson(String str) => Law.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Law.fromJson(Map<String, dynamic> json) => Law(
    id: json["id"],
    url: json["URL"],
    laws: json["laws"],
    section: json["section"],
    chapter: json["chapter"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "URL": url,
    "laws": laws,
    "section": section,
    "chapter": chapter,
  };
}
