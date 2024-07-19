import 'dart:convert';

class Post {
  String title;
  String authors;
  int views;
  String imageUrl;

  Post({
    required this.title,
    required this.authors,
    required this.views,
    required this.imageUrl,
  });

  Post copyWith({
    String? title,
    String? authors,
    int? views,
    String? imageUrl,
  }) =>
      Post(
        title: title ?? this.title,
        authors: authors ?? this.authors,
        views: views ?? this.views,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        authors: json["authors"],
        views: json["views"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": authors,
        "views": views,
        "imageUrl": imageUrl,
      };
}
