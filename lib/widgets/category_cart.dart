import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/custom_network_image.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String label;

  //static const double _width = 40.0;
  static const double _fontSize = 14.0;

  const CategoryCard({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Container(
        padding: CategoryCardPaddings.paddingAll,
        child: Column(
          children: [
            CustomNetworkImage(url: imageUrl),
            _space(),
            Text(
              label,
              style: const TextStyle(
                fontSize: _fontSize,
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _space() => const SizedBox(height: 6);
}

class CategoryCardPaddings {
  static const EdgeInsets paddingAll = EdgeInsets.all(12);
}
