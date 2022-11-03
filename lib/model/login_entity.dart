import 'dart:convert';

class LoginEntity {
  LoginEntity({
    this.status,
    this.authenticated,
    this.userName,
    this.referid,
    this.email,
    this.regOn,
    this.point,
    this.endOn,
    this.errorMsg,
  });

  String? status;
  var authenticated;
  String? userName;
  String? referid;
  String? email;
  DateTime? regOn;
  String? point;
  DateTime? endOn;
  String? errorMsg;

  factory LoginEntity.fromRawJson(String str) => LoginEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
    status: json["status"] ?? '',
    authenticated: json["authenticated"]?? '',
    userName: json["userName"]?? '',
    referid: json["referid"]?? '',
    email: json["email"]?? '',
    regOn: json["regOn"] == null ? null : DateTime.parse(json["regOn"]),
    point: json["point"]?? '',
    endOn: json["endOn"] == null ? null : DateTime.parse(json["endOn"]),
    errorMsg: json["errorMsg"]?? '',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "authenticated": authenticated,
    "userName": userName,
    "referid": referid,
    "email": email,
    "regOn": regOn?.toIso8601String(),
    "point": point,
    "endOn": endOn?.toIso8601String(),
    "errorMsg": errorMsg,
  };
}
