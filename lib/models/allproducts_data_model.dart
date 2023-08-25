// To parse this JSON data, do
//
//     final allProductDataModel = allProductDataModelFromJson(jsonString);

import 'dart:convert';

AllProductDataModel allProductDataModelFromJson(String str) => AllProductDataModel.fromJson(json.decode(str));

String allProductDataModelToJson(AllProductDataModel data) => json.encode(data.toJson());

class AllProductDataModel {
    int count;
    List<ProductsDetails> data;

    AllProductDataModel({
        required this.count,
        required this.data,
    });

    factory AllProductDataModel.fromJson(Map<String, dynamic> json) => AllProductDataModel(
        count: json["count"],
        data: List<ProductsDetails>.from(json["data"].map((x) => ProductsDetails.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ProductsDetails {
    String id;
    String name;
    int price;
    String description;
    String image;
    String category;
    String company;
    List<Color> colors;
    bool featured;
    bool freeShipping;
    int inventory;
    int averageRating;
    Admin? admin;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    ProductsDetails({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.image,
        required this.category,
        required this.company,
        required this.colors,
        required this.featured,
        required this.freeShipping,
        required this.inventory,
        required this.averageRating,
        required this.admin,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory ProductsDetails.fromJson(Map<String, dynamic> json) => ProductsDetails(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        category: json["category"],
        company: json["company"],
        colors: List<Color>.from(json["colors"].map((x) => colorValues.map[x]!)),
        featured: json["featured"],
        freeShipping: json["freeShipping"],
        inventory: json["inventory"],
        averageRating: json["averageRating"],
        admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
        "company": company,
        "colors": List<dynamic>.from(colors.map((x) => colorValues.reverse[x])),
        "featured": featured,
        "freeShipping": freeShipping,
        "inventory": inventory,
        "averageRating": averageRating,
        "admin": admin?.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Admin {
    String id;
    String name;

    Admin({
        required this.id,
        required this.name,
    });

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

enum Color {
    THE_000,
    THE_0000_FF,
    THE_00_FF00
}

final colorValues = EnumValues({
    "#000": Color.THE_000,
    "#0000ff": Color.THE_0000_FF,
    "#00ff00": Color.THE_00_FF00
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
