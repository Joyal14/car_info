import 'dart:convert';

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

class Otp {
  Status? status;
  Data? data;

  Otp({
    this.status,
    this.data,
  });

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  String? phone;
  String? signCode;

  Data({
    this.phone,
    this.signCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        phone: json["phone"],
        signCode: json["signCode"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "signCode": signCode,
      };
}

class Status {
  int? code;
  String? message;

  Status({
    this.code,
    this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
