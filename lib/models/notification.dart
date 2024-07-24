import 'dart:convert';

class NotificationModel {
  final String uuid;
  final String title;
  final String text;
  final String imageUrl;

  NotificationModel(
      {required this.uuid,
      required this.title,
      required this.text,
      required this.imageUrl});

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        uuid: json["uuid"],
        title: json["title"],
        text: json["text"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "title": title,
        "text": text,
        "imageUrl": imageUrl,
      };
}
