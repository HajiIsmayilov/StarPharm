import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:star_pharm/widgets/custom_network_image.dart';

import '../shared/shared_padding.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.imageUrl, required this.label});
  static const double _fontSize = 14.0;
  final String imageUrl;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Container(
        padding: SharedPadding().paddingAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomNetworkImage(url: imageUrl),
            const SizedBox(height: 6),
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
}
