import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/custom_network_image.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String label;

  static const double _width = 40.0;
  static const double _fontSize = 18.0;

  const CategoryCard({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CustomNetworkImage(
          url: imageUrl,
          width: _width,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
