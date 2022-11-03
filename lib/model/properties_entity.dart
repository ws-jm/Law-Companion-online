// To parse this JSON data, do
//
//     final propertiesEntity = propertiesEntityFromJson(jsonString);

import 'dart:convert';

class PropertiesEntity {
  PropertiesEntity({
    this.status,
    this.properties,
  });

  String? status;
  List<Property>? properties;

  factory PropertiesEntity.fromRawJson(String str) => PropertiesEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PropertiesEntity.fromJson(Map<String, dynamic> json) => PropertiesEntity(
    status: json["status"],
    properties: List<Property>.from(json["properties"].map((x) => Property.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "properties": List<dynamic>.from(properties!.map((x) => x.toJson())),
  };
}

class Property {
  Property({
    this.id,
    this.imageUrl,
    this.description,
    this.location,
    this.price,
    this.fullName,
    this.email,
    this.isApproved,
  });

  String? id;
  String? imageUrl;
  String? description;
  String? location;
  String? price;
  String? fullName;
  String? email;
  String? isApproved;

  factory Property.fromRawJson(String str) => Property.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    imageUrl: json["image_url"],
    description: json["description"],
    location: json["location"],
    price: json["price"],
    fullName: json["full_name"],
    email: json["email"],
    isApproved: json["is_approved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
    "description": description,
    "location": location,
    "price": price,
    "full_name": fullName,
    "email": email,
    "is_approved": isApproved,
  };
}
