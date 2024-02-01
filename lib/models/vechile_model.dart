// To parse this JSON data, do
//
//     final vechileList = vechileListFromJson(jsonString);

import 'dart:convert';

VechileList vechileListFromJson(String str) =>
    VechileList.fromJson(json.decode(str));

String vechileListToJson(VechileList data) => json.encode(data.toJson());

class VechileList {
  Status? status;
  Data? data;

  VechileList({
    this.status,
    this.data,
  });

  factory VechileList.fromJson(Map<String, dynamic> json) => VechileList(
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
  int? nextPage;

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
  String? showroomId;
  String? carBrand;
  String? model;
  int? price;
  String? year;
  int? kmDriven;
  String? fuelType;
  String? transmission;
  String? registrationNumber;
  String? color;
  String? mileage;
  String? numberOfOwner;
  String? seats;
  String? insurance;
  String? bodyType;
  List<CarImage>? carImages;
  String? location;
  LocationPoint? locationPoint;
  String? status;
  String? videoLink;
  String? sellingStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  double? distance;
  List<dynamic>? sellerData;
  List<ShowroomDatum>? showroomData;
  List<dynamic>? subscriptionData;
  BrandData? brandData;
  ModelData? modelData;
  FuelTypeDataClass? fuelTypeData;
  BodytypeDataClass? colorData;
  FuelTypeDataClass? numberOfOwnerData;
  FuelTypeDataClass? seatsData;
  BodytypeDataClass? bodytypeData;
  BodytypeDataClass? transmissionData;
  FuelTypeDataClass? yearData;
  FuelTypeDataClass? insuranceData;
  List<dynamic>? favData;
  bool? isLiked;

  Doc({
    this.id,
    this.showroomId,
    this.carBrand,
    this.model,
    this.price,
    this.year,
    this.kmDriven,
    this.fuelType,
    this.transmission,
    this.registrationNumber,
    this.color,
    this.mileage,
    this.numberOfOwner,
    this.seats,
    this.insurance,
    this.bodyType,
    this.carImages,
    this.location,
    this.locationPoint,
    this.status,
    this.videoLink,
    this.sellingStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.distance,
    this.sellerData,
    this.showroomData,
    this.subscriptionData,
    this.brandData,
    this.modelData,
    this.fuelTypeData,
    this.colorData,
    this.numberOfOwnerData,
    this.seatsData,
    this.bodytypeData,
    this.transmissionData,
    this.yearData,
    this.insuranceData,
    this.favData,
    this.isLiked,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["_id"],
        showroomId: json["showroomId"],
        carBrand: json["carBrand"],
        model: json["model"],
        price: json["price"],
        year: json["year"],
        kmDriven: json["kmDriven"],
        fuelType: json["fuelType"],
        transmission: json["transmission"],
        registrationNumber: json["registrationNumber"],
        color: json["color"],
        mileage: json["mileage"],
        numberOfOwner: json["numberOfOwner"],
        seats: json["seats"],
        insurance: json["insurance"],
        bodyType: json["bodyType"],
        carImages: json["carImages"] == null
            ? []
            : List<CarImage>.from(
                json["carImages"]!.map((x) => CarImage.fromJson(x))),
        location: json["location"],
        locationPoint: json["location_point"] == null
            ? null
            : LocationPoint.fromJson(json["location_point"]),
        status: json["status"],
        videoLink: json["videoLink"],
        sellingStatus: json["sellingStatus"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        distance: json["distance"]?.toDouble(),
        sellerData: json["sellerData"] == null
            ? []
            : List<dynamic>.from(json["sellerData"]!.map((x) => x)),
        showroomData: json["showroomData"] == null
            ? []
            : List<ShowroomDatum>.from(
                json["showroomData"]!.map((x) => ShowroomDatum.fromJson(x))),
        subscriptionData: json["subscriptionData"] == null
            ? []
            : List<dynamic>.from(json["subscriptionData"]!.map((x) => x)),
        brandData: json["brandData"] == null
            ? null
            : BrandData.fromJson(json["brandData"]),
        modelData: json["modelData"] == null
            ? null
            : ModelData.fromJson(json["modelData"]),
        fuelTypeData: json["fuelTypeData"] == null
            ? null
            : FuelTypeDataClass.fromJson(json["fuelTypeData"]),
        colorData: json["colorData"] == null
            ? null
            : BodytypeDataClass.fromJson(json["colorData"]),
        numberOfOwnerData: json["numberOfOwnerData"] == null
            ? null
            : FuelTypeDataClass.fromJson(json["numberOfOwnerData"]),
        seatsData: json["seatsData"] == null
            ? null
            : FuelTypeDataClass.fromJson(json["seatsData"]),
        bodytypeData: json["bodytypeData"] == null
            ? null
            : BodytypeDataClass.fromJson(json["bodytypeData"]),
        transmissionData: json["transmissionData"] == null
            ? null
            : BodytypeDataClass.fromJson(json["transmissionData"]),
        yearData: json["yearData"] == null
            ? null
            : FuelTypeDataClass.fromJson(json["yearData"]),
        insuranceData: json["insuranceData"] == null
            ? null
            : FuelTypeDataClass.fromJson(json["insuranceData"]),
        favData: json["fav_data"] == null
            ? []
            : List<dynamic>.from(json["fav_data"]!.map((x) => x)),
        isLiked: json["is_liked"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "showroomId": showroomId,
        "carBrand": carBrand,
        "model": model,
        "price": price,
        "year": year,
        "kmDriven": kmDriven,
        "fuelType": fuelType,
        "transmission": transmission,
        "registrationNumber": registrationNumber,
        "color": color,
        "mileage": mileage,
        "numberOfOwner": numberOfOwner,
        "seats": seats,
        "insurance": insurance,
        "bodyType": bodyType,
        "carImages": carImages == null
            ? []
            : List<dynamic>.from(carImages!.map((x) => x.toJson())),
        "location": location,
        "location_point": locationPoint?.toJson(),
        "status": status,
        "videoLink": videoLink,
        "sellingStatus": sellingStatus,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "distance": distance,
        "sellerData": sellerData == null
            ? []
            : List<dynamic>.from(sellerData!.map((x) => x)),
        "showroomData": showroomData == null
            ? []
            : List<dynamic>.from(showroomData!.map((x) => x.toJson())),
        "subscriptionData": subscriptionData == null
            ? []
            : List<dynamic>.from(subscriptionData!.map((x) => x)),
        "brandData": brandData?.toJson(),
        "modelData": modelData?.toJson(),
        "fuelTypeData": fuelTypeData?.toJson(),
        "colorData": colorData?.toJson(),
        "numberOfOwnerData": numberOfOwnerData?.toJson(),
        "seatsData": seatsData?.toJson(),
        "bodytypeData": bodytypeData?.toJson(),
        "transmissionData": transmissionData?.toJson(),
        "yearData": yearData?.toJson(),
        "insuranceData": insuranceData?.toJson(),
        "fav_data":
            favData == null ? [] : List<dynamic>.from(favData!.map((x) => x)),
        "is_liked": isLiked,
      };
}

class BodytypeDataClass {
  String? id;
  String? bodyType;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? color;
  String? transmissionType;

  BodytypeDataClass({
    this.id,
    this.bodyType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.color,
    this.transmissionType,
  });

  factory BodytypeDataClass.fromJson(Map<String, dynamic> json) =>
      BodytypeDataClass(
        id: json["_id"],
        bodyType: json["bodyType"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        color: json["color"],
        transmissionType: json["transmissionType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "bodyType": bodyType,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "color": color,
        "transmissionType": transmissionType,
      };
}

class BrandData {
  String? id;
  String? brandName;
  bool? topBrand;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  BrandData({
    this.id,
    this.brandName,
    this.topBrand,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
        id: json["_id"],
        brandName: json["brandName"],
        topBrand: json["topBrand"],
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
        "brandName": brandName,
        "topBrand": topBrand,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CarImage {
  String? imgUrl;

  CarImage({
    this.imgUrl,
  });

  factory CarImage.fromJson(Map<String, dynamic> json) => CarImage(
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
      };
}

class FuelTypeDataClass {
  String? id;
  String? fuelType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? insuranceType;
  int? numberOfOwner;
  int? seats;
  int? year;

  FuelTypeDataClass({
    this.id,
    this.fuelType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.insuranceType,
    this.numberOfOwner,
    this.seats,
    this.year,
  });

  factory FuelTypeDataClass.fromJson(Map<String, dynamic> json) =>
      FuelTypeDataClass(
        id: json["_id"],
        fuelType: json["fuelType"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        insuranceType: json["insuranceType"],
        numberOfOwner: json["numberOfOwner"],
        seats: json["seats"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fuelType": fuelType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "insuranceType": insuranceType,
        "numberOfOwner": numberOfOwner,
        "seats": seats,
        "year": year,
      };
}

class LocationPoint {
  List<double>? coordinates;
  String? type;

  LocationPoint({
    this.coordinates,
    this.type,
  });

  factory LocationPoint.fromJson(Map<String, dynamic> json) => LocationPoint(
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
        "type": type,
      };
}

class ModelData {
  String? id;
  String? modelName;
  String? brandId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ModelData({
    this.id,
    this.modelName,
    this.brandId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ModelData.fromJson(Map<String, dynamic> json) => ModelData(
        id: json["_id"],
        modelName: json["modelName"],
        brandId: json["brandId"],
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
        "modelName": modelName,
        "brandId": brandId,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class ShowroomDatum {
  String? id;
  String? buyerId;
  String? showroomName;
  String? ownerName;
  String? location;
  LocationPoint? locationPoint;
  String? address;
  int? contactNumber1;
  String? contactNumber2;
  String? openTime;
  String? closeTime;
  String? feedback;
  List<ShowroomImage>? showroomImages;
  String? sellerType;
  String? document1;
  String? document2;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ShowroomDatum({
    this.id,
    this.buyerId,
    this.showroomName,
    this.ownerName,
    this.location,
    this.locationPoint,
    this.address,
    this.contactNumber1,
    this.contactNumber2,
    this.openTime,
    this.closeTime,
    this.feedback,
    this.showroomImages,
    this.sellerType,
    this.document1,
    this.document2,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ShowroomDatum.fromJson(Map<String, dynamic> json) => ShowroomDatum(
        id: json["_id"],
        buyerId: json["buyerId"],
        showroomName: json["showroomName"],
        ownerName: json["ownerName"],
        location: json["location"],
        locationPoint: json["location_point"] == null
            ? null
            : LocationPoint.fromJson(json["location_point"]),
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
        document1: json["document1"],
        document2: json["document2"],
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
        "buyerId": buyerId,
        "showroomName": showroomName,
        "ownerName": ownerName,
        "location": location,
        "location_point": locationPoint?.toJson(),
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
        "document1": document1,
        "document2": document2,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
