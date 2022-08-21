// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetProductModel> getProductModelFromJson(String str) => List<GetProductModel>.from(json.decode(str).map((x) => GetProductModel.fromJson(x)));

String getProductModelToJson(List<GetProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProductModel {
    GetProductModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.images,
        required this.categoryId,
    });

    int? id;
    String? title;
    int? price;
    String? description;
    Category? category;
    List<String>? images;
    int? categoryId;

    factory GetProductModel.fromJson(Map<String, dynamic> json) => GetProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category!.toJson(),
        "images": List<dynamic>.from(images!.map((x) => x)),
        "categoryId": categoryId == null ? null : categoryId,
    };
}

class Category {
    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.keyLoremSpace,
    });

    int id;
    String? name;
    String? image;
    String ?keyLoremSpace;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        keyLoremSpace: json["keyLoremSpace"] == null ? null : json["keyLoremSpace"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "keyLoremSpace": keyLoremSpace == null ? null : keyLoremSpace,
    };
}
