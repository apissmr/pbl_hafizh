import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScanPage extends StatefulWidget {
  const CameraScanPage({super.key});

  @override
  _CameraScanPageState createState() => _CameraScanPageState();
}

class _CameraScanPageState extends State<CameraScanPage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras![0],
        ResolutionPreset.high,
      );
      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Scan Wajah"),
      ),
      body: _isCameraInitialized
          ? CameraPreview(_cameraController!)
          : Center(
              child:
                  CircularProgressIndicator()), // Tampilkan kamera jika sudah siap
    );
  }
}