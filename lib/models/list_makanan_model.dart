// To parse this JSON data, do
//
//     final listMakananModel = listMakananModelFromJson(jsonString);

import 'dart:convert';

import 'package:stok_makanan/models/makanan_model.dart';

ListMakananModel listMakananModelFromJson(String str) => ListMakananModel.fromJson(json.decode(str));

String listMakananModelToJson(ListMakananModel data) => json.encode(data.toJson());

class ListMakananModel {
    ListMakananModel({
        required this.status,
        required this.message,
        this.data,
    });

    int status;
    String message;
    List<MakananModel>? data;

    factory ListMakananModel.fromJson(Map<String, dynamic> json) => ListMakananModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: List<MakananModel>.from(json["data"].map((x) => MakananModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}