import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String author;
  final int views;
  final String imageUrl;

  PostCard({required this.title, required this.author, required this.views, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: Image.network(
              imageUrl,
              height: 125.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(author),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Views: $views'),
          ),
        ],
      ),
    );
  }
}
