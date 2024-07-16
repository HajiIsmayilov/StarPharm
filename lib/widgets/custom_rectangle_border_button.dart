import 'package:flutter/material.dart';

class CustomRectangleBorderButton extends StatelessWidget {
  const CustomRectangleBorderButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  static const double _borderRadius = 16.0;
  static const double _verticalPadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          //primary: Colors.teal,
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(vertical: _verticalPadding),
          textStyle: const TextStyle(
            fontSize: 20,
          )),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
