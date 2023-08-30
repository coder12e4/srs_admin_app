// To parse this JSON data, do
//
//     final allOrder = allOrderFromJson(jsonString);

import 'dart:convert';

AllOrder allOrderFromJson(String str) => AllOrder.fromJson(json.decode(str));

String allOrderToJson(AllOrder data) => json.encode(data.toJson());

class AllOrder {
    int count;
    List<Allorderdetails> data;

    AllOrder({
        required this.count,
        required this.data,
    });

    factory AllOrder.fromJson(Map<String, dynamic> json) => AllOrder(
        count: json["count"],
        data: List<Allorderdetails>.from(json["data"].map((x) => Allorderdetails.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Allorderdetails {
    String id;
    int shippingFee;
    int subtotal;
    int total;
    List<OrderItem> orderItems;
    String status;
    String paymentMode;
    dynamic user;
    String clientSecret;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Allorderdetails({
        required this.id,
        required this.shippingFee,
        required this.subtotal,
        required this.total,
        required this.orderItems,
        required this.status,
        required this.paymentMode,
        required this.user,
        required this.clientSecret,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Allorderdetails.fromJson(Map<String, dynamic> json) => Allorderdetails(
        id: json["_id"],
        shippingFee: json["shippingFee"],
        subtotal: json["subtotal"],
        total: json["total"],
        orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
        status: json["status"],
        paymentMode: json["paymentMode"],
        user: json["user"],
        clientSecret: json["clientSecret"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "shippingFee": shippingFee,
        "subtotal": subtotal,
        "total": total,
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "status": status,
        "paymentMode": paymentMode,
        "user": user,
        "clientSecret": clientSecret,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class OrderItem {
    Name name;
    String image;
    int price;
    int quantity;
    Product product;
    String id;

    OrderItem({
        required this.name,
        required this.image,
        required this.price,
        required this.quantity,
        required this.product,
        required this.id,
    });

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        name: nameValues.map[json["name"]]!,
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
        product: productValues.map[json["product"]]!,
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "image": image,
        "price": price,
        "quantity": quantity,
        "product": productValues.reverse[product],
        "_id": id,
    };
}

enum Name {
    ACCENT_CHAIR,
    ALBANY_SECTIONAL,
    EMPEROR_BED
}

final nameValues = EnumValues({
    "accent chair": Name.ACCENT_CHAIR,
    "albany sectional": Name.ALBANY_SECTIONAL,
    "emperor bed": Name.EMPEROR_BED
});

enum Product {
    THE_6493_DE8_C98_C8_C93_E6_B737401,
    THE_6493_DEB298_C8_C93_E6_B737403,
    THE_6493_DEBE98_C8_C93_E6_B737405
}

final productValues = EnumValues({
    "6493de8c98c8c93e6b737401": Product.THE_6493_DE8_C98_C8_C93_E6_B737401,
    "6493deb298c8c93e6b737403": Product.THE_6493_DEB298_C8_C93_E6_B737403,
    "6493debe98c8c93e6b737405": Product.THE_6493_DEBE98_C8_C93_E6_B737405
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
