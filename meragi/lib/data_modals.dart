// To parse this JSON data, do
//
//     final miragi = miragiFromJson(jsonString);

import 'dart:convert';

class Miragi {
    int id;
    String title;
    double price;
    String description;
    Category category;
    String image;
    Rating rating;

    Miragi({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    Miragi copyWith({
        int? id,
        String? title,
        double? price,
        String? description,
        Category? category,
        String? image,
        Rating? rating,
    }) => 
        Miragi(
            id: id ?? this.id,
            title: title ?? this.title,
            price: price ?? this.price,
            description: description ?? this.description,
            category: category ?? this.category,
            image: image ?? this.image,
            rating: rating ?? this.rating,
        );

    factory Miragi.fromRawJson(String str) => Miragi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Miragi.fromJson(Map<String, dynamic> json) => Miragi(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating.toJson(),
    };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
    "electronics": Category.ELECTRONICS,
    "jewelery": Category.JEWELERY,
    "men's clothing": Category.MEN_S_CLOTHING,
    "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
    double rate;
    int count;

    Rating({
        required this.rate,
        required this.count,
    });

    Rating copyWith({
        double? rate,
        int? count,
    }) => 
        Rating(
            rate: rate ?? this.rate,
            count: count ?? this.count,
        );

    factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
