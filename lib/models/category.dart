import 'dart:convert';

class Category {
  String title;
  String imageUrl;

  Category({
    required this.title,
    required this.imageUrl,
  });

  Category copyWith({
    String? title,
    String? imageUrl,
  }) =>
      Category(
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "imageUrl": imageUrl,
      };
}
