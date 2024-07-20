import 'dart:io';

import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/custom_rectangle_border_button.dart';

class ImageShowerScreen extends StatelessWidget {
  const ImageShowerScreen({super.key, required this.imagePath});
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.file(
                  File(imagePath!),
                  fit: BoxFit.cover,
                )),
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 36,
                    ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomRectangleBorderButton(
                    title: 'Send',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
