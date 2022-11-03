// To parse this JSON data, do
//
//     final rulesEntity = rulesEntityFromJson(jsonString);

import 'dart:convert';

class RulesEntity {
  RulesEntity({
    this.status,
    this.rules,
  });

  String? status;
  List<Rule>? rules;

  factory RulesEntity.fromRawJson(String str) => RulesEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RulesEntity.fromJson(Map<String, dynamic> json) => RulesEntity(
    status: json["status"],
    rules: List<Rule>.from(json["rules"].map((x) => Rule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "rules": List<dynamic>.from(rules!.map((x) => x.toJson())),
  };
}

class Rule {
  Rule({
    this.id,
    this.url,
    this.rules,
  });

  String? id;
  String? url;
  String? rules;

  factory Rule.fromRawJson(String str) => Rule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
    id: json["id"],
    url: json["URL"],
    rules: json["rules"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "URL": url,
    "rules": rules,
  };
}
