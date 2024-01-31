import 'dart:convert';

SuccessFullOtpSend successFullOtpSendFromJson(String str) =>
    SuccessFullOtpSend.fromJson(json.decode(str));

String successFullOtpSendToJson(SuccessFullOtpSend data) =>
    json.encode(data.toJson());

class SuccessFullOtpSend {
  Status? status;
  Data? data;

  SuccessFullOtpSend({
    this.status,
    this.data,
  });

  factory SuccessFullOtpSend.fromJson(Map<String, dynamic> json) =>
      SuccessFullOtpSend(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  String? tokenType;
  String? expiresIn;
  String? accessToken;
  Buyer? buyer;

  Data({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.buyer,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        buyer: json["buyer"] == null ? null : Buyer.fromJson(json["buyer"]),
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "buyer": buyer?.toJson(),
      };
}

class Buyer {
  String? id;
  int? phone;
  int? registered;

  Buyer({
    this.id,
    this.phone,
    this.registered,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        id: json["_id"],
        phone: json["phone"],
        registered: json["registered"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "registered": registered,
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
