// To parse this JSON data, do
//
//     final carColor = carColorFromJson(jsonString);

import 'dart:convert';

CarColorModel carColorFromJson(String str) =>
    CarColorModel.fromJson(json.decode(str));

String carColorToJson(CarColorModel data) => json.encode(data.toJson());

class CarColorModel {
  Status? status;
  CarColors? data;

  CarColorModel({
    this.status,
    this.data,
  });

  factory CarColorModel.fromJson(Map<String, dynamic> json) => CarColorModel(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null ? null : CarColors.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data?.toJson(),
      };
}

class CarColors {
  List<Doc>? docs;
  int? totalDocs;
  int? limit;
  int? page;
  int? totalPages;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  CarColors({
    this.docs,
    this.totalDocs,
    this.limit,
    this.page,
    this.totalPages,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory CarColors.fromJson(Map<String, dynamic> json) => CarColors(
        docs: json["docs"] == null
            ? []
            : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        page: json["page"],
        totalPages: json["totalPages"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "docs": docs == null
            ? []
            : List<dynamic>.from(docs!.map((x) => x.toJson())),
        "totalDocs": totalDocs,
        "limit": limit,
        "page": page,
        "totalPages": totalPages,
        "pagingCounter": pagingCounter,
        "hasPrevPage": hasPrevPage,
        "hasNextPage": hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage,
      };
}

class Doc {
  String? id;
  String? color;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Doc({
    this.id,
    this.color,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["_id"],
        color: json["color"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "color": color,
        "status": status,
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
