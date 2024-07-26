import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  late XFile file;

  Future<void> _setupCameraController() async {
    // ignore: no_leading_underscores_for_local_identifiers
    List<CameraDescription> _cameras = await availableCameras();

    if (_cameras.isNotEmpty) {
      setState(() {
        cameras = _cameras;
        cameraController =
            CameraController(_cameras.first, ResolutionPreset.high);
      });

      cameraController?.initialize().then((_) {
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CameraPreview(
            cameraController!,
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 36,
                  )),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () async {
                _takePicture(context);
              },
              child: const Icon(
                Icons.camera,
                size: 48,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _takePicture(BuildContext context) async {
    try {
      final XFile picture = await cameraController!.takePicture();
      setState(() {
        file = picture;
      });
    } catch (e) {
      print("Error taking picture: $e");
    }
  }
}
