// To parse this JSON data, do
//
//     final dealerDetails = dealerDetailsFromJson(jsonString);

import 'dart:convert';

DealerDetails dealerDetailsFromJson(String str) =>
    DealerDetails.fromJson(json.decode(str));

String dealerDetailsToJson(DealerDetails data) => json.encode(data.toJson());

class DealerDetails {
  Status? status;
  Data? data;

  DealerDetails({
    this.status,
    this.data,
  });

  factory DealerDetails.fromJson(Map<String, dynamic> json) => DealerDetails(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  String? buyerId;
  String? showroomId;
  String? requestorName;
  int? requestorPhone;
  String? requestorEmail;
  int? appoitmentCount;
  DateTime? appointmentTime;
  String? carId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.buyerId,
    this.showroomId,
    this.requestorName,
    this.requestorPhone,
    this.requestorEmail,
    this.appoitmentCount,
    this.appointmentTime,
    this.carId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        buyerId: json["buyerId"],
        showroomId: json["showroomId"],
        requestorName: json["requestorName"],
        requestorPhone: json["requestorPhone"],
        requestorEmail: json["requestorEmail"],
        appoitmentCount: json["appoitmentCount"],
        appointmentTime: json["appointmentTime"] == null
            ? null
            : DateTime.parse(json["appointmentTime"]),
        carId: json["carId"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "buyerId": buyerId,
        "showroomId": showroomId,
        "requestorName": requestorName,
        "requestorPhone": requestorPhone,
        "requestorEmail": requestorEmail,
        "appoitmentCount": appoitmentCount,
        "appointmentTime": appointmentTime?.toIso8601String(),
        "carId": carId,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
