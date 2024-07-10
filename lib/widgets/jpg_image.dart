import 'package:flutter/material.dart';

class JpgImage extends StatelessWidget {
  const JpgImage({
    super.key,
    required this.url,
    required this.width,
    this.fit = BoxFit.cover,
  });

  final String url;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      width: width,
      fit: BoxFit.cover,
    );
  }
}