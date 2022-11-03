// To parse this JSON data, do
//
//     final registerEntity = registerEntityFromJson(jsonString);

import 'dart:convert';

class RegisterEntity {
  RegisterEntity({
    this.status,
    this.errorMsg,
  });

  String? status;
  String? errorMsg;

  factory RegisterEntity.fromRawJson(String str) => RegisterEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterEntity.fromJson(Map<String, dynamic> json) => RegisterEntity(
    status: json["status"] ?? '',
    errorMsg: json["errorMsg"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "errorMsg": errorMsg,
  };
}
