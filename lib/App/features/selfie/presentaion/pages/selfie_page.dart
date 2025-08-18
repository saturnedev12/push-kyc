import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:push_kyc/main.dart';

class SelfiePage extends StatefulWidget {
  const SelfiePage({super.key});

  @override
  State<SelfiePage> createState() => _SelfiePageState();
}

class _SelfiePageState extends State<SelfiePage> {
  late CameraController controller;
  late FaceDetector _faceDetector;
  bool _isDetecting = false;

  void _startStream() {
    controller.startImageStream((CameraImage image) async {
      if (_isDetecting) return;
      _isDetecting = true;

      try {
        final inputImage = _convertCameraImage(image, controller.description);
        final faces = await _faceDetector.processImage(inputImage);

        if (faces.isEmpty) {
          log("❌ Aucun visage détecté");
        } else {
          log("✅ ${faces.length} visage(s) détecté(s)");
          for (final face in faces) {
            log(" - Box: ${face.boundingBox}");
            log(" - Smile: ${face.smilingProbability}");
          }
        }
      } catch (e) {
        log("Erreur: $e");
      }

      _isDetecting = false;
    });
  }

  InputImage _convertCameraImage(CameraImage image, CameraDescription camera) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(
      image.width.toDouble(),
      image.height.toDouble(),
    );

    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation) ??
        InputImageRotation.rotation0deg;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw) ??
        InputImageFormat.nv21;

    final inputImageData = InputImageMetadata(
      size: imageSize,
      rotation: imageRotation,
      format: inputImageFormat,
      bytesPerRow: image.planes.first.bytesPerRow,
    );

    return InputImage.fromBytes(bytes: bytes, metadata: inputImageData);
  }

  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller
        .initialize()
        .then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
          // _startStream();
        })
        .catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                // Handle access errors here.
                break;
              default:
                // Handle other errors here.
                break;
            }
          }
        });
    // Config FaceDetector
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.fast,
        enableClassification: true,
        enableContours: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CameraPreview(controller));
  }
}
