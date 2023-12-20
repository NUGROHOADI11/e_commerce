import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    int id;
    String title;
    String image;
    String imageType;
    String restaurantChain;
    Servings servings;

    Product({
        required this.id,
        required this.title,
        required this.image,
        required this.imageType,
        required this.restaurantChain,
        required this.servings,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
        restaurantChain: json["restaurantChain"],
        servings: Servings.fromJson(json["servings"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageType,
        "restaurantChain": restaurantChain,
        "servings": servings.toJson(),
    };
}

class Servings {
    double number;
    dynamic size;
    dynamic unit;

    Servings({
        required this.number,
        required this.size,
        required this.unit,
    });

    factory Servings.fromJson(Map<String, dynamic> json) => Servings(
        number: json["number"],
        size: json["size"],
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "size": size,
        "unit": unit,
    };
}
