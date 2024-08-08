import 'package:flutter/material.dart';
import './slider.dart';

class SlidableCard extends StatelessWidget {
  final Card card;
  final Icon icon;
  final VoidCallback onSlided;
  const SlidableCard({
    super.key,
    required this.card,
    required this.icon,
    required this.onSlided,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableWidget(
      background: buildBackground(),
      onSlided: onSlided,
      child: card,
    );
  }

  Widget buildBackground() => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.black.withOpacity(0.1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerRight,
        child: icon,
      );
}
