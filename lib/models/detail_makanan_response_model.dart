// To parse this JSON data, do
//
//     final detailMakananResponseModel = detailMakananResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:stok_makanan/models/makanan_model.dart';

DetailMakananResponseModel detailMakananResponseModelFromJson(String str) =>
    DetailMakananResponseModel.fromJson(json.decode(str));

String detailMakananResponseModelToJson(DetailMakananResponseModel data) =>
    json.encode(data.toJson());

class DetailMakananResponseModel {
  DetailMakananResponseModel({
    required this.status,
    required this.message,
    this.data,
  });

  int status;
  String message;
  MakananModel? data;

  factory DetailMakananResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailMakananResponseModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : MakananModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}
