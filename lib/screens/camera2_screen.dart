import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';

class Camera2Screen extends StatelessWidget {
  const Camera2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.photo(),
      onMediaTap: (mediaCapture) {
        //   OpenFile.open(mediaCapture.filePath);
      },
    );
  }
}
