import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.imageUrl,
    required this.questioner,
    required this.question,
  });

  final String imageUrl;
  final String questioner;
  final String question;

  static const double _avatarRadius = 30;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: _avatarRadius,
        ),
        title: Text(
          questioner,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(question),
      ),
    );
  }
}
