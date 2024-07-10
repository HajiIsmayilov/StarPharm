import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
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
    return Image.network(
      url,
      width: width,
      fit: BoxFit.cover,
    );
  }
}