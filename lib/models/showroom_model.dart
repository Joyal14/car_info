// To parse this JSON data, do
//
//     final showRoomList = showRoomListFromJson(jsonString);

import 'dart:convert';

ShowRoomList showRoomListFromJson(String str) =>
    ShowRoomList.fromJson(json.decode(str));

String showRoomListToJson(ShowRoomList data) => json.encode(data.toJson());

class ShowRoomList {
  Status? status;
  Data? data;

  ShowRoomList({
    this.status,
    this.data,
  });

  factory ShowRoomList.fromJson(Map<String, dynamic> json) => ShowRoomList(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  List<Doc>? docs;
  int? totalDocs;
  int? limit;
  int? page;
  int? totalPages;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
  String? buyerId;
  String? showroomName;
  String? ownerName;
  String? location;
  String? address;
  int? contactNumber1;
  String? contactNumber2;
  String? openTime;
  String? closeTime;
  String? feedback;
  List<ShowroomImage>? showroomImages;
  String? sellerType;
  int? carcount;

  Doc({
    this.id,
    this.buyerId,
    this.showroomName,
    this.ownerName,
    this.location,
    this.address,
    this.contactNumber1,
    this.contactNumber2,
    this.openTime,
    this.closeTime,
    this.feedback,
    this.showroomImages,
    this.sellerType,
    this.carcount,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["_id"],
        buyerId: json["buyerId"],
        showroomName: json["showroomName"],
        ownerName: json["ownerName"],
        location: json["location"],
        address: json["address"],
        contactNumber1: json["contactNumber1"],
        contactNumber2: json["contactNumber2"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        feedback: json["feedback"],
        showroomImages: json["showroomImages"] == null
            ? []
            : List<ShowroomImage>.from(
                json["showroomImages"]!.map((x) => ShowroomImage.fromJson(x))),
        sellerType: json["sellerType"],
        carcount: json["carcount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "buyerId": buyerId,
        "showroomName": showroomName,
        "ownerName": ownerName,
        "location": location,
        "address": address,
        "contactNumber1": contactNumber1,
        "contactNumber2": contactNumber2,
        "openTime": openTime,
        "closeTime": closeTime,
        "feedback": feedback,
        "showroomImages": showroomImages == null
            ? []
            : List<dynamic>.from(showroomImages!.map((x) => x.toJson())),
        "sellerType": sellerType,
        "carcount": carcount,
      };
}

class ShowroomImage {
  String? index;
  String? url;

  ShowroomImage({
    this.index,
    this.url,
  });

  factory ShowroomImage.fromJson(Map<String, dynamic> json) => ShowroomImage(
        index: json["index"],
        url: json["Url"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "Url": url,
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
