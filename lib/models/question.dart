import 'dart:convert';

class Question {
  String imageUrl;
  String questioner;
  String question;

  Question({
    required this.imageUrl,
    required this.questioner,
    required this.question,
  });

  Question copyWith({
    String? imageUrl,
    String? questioner,
    String? question,
  }) =>
      Question(
        imageUrl: imageUrl ?? this.imageUrl,
        questioner: questioner ?? this.questioner,
        question: question ?? this.question,
      );

  factory Question.fromRawJson(String str) =>
      Question.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        imageUrl: json["imageUrl"],
        questioner: json["questioner"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "questioner": questioner,
        "question": question,
      };
}
