import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

/// Appelle ceci dans startImageStream((image) { ... })
InputImage cameraImageToInputImage(
  CameraImage image,
  CameraDescription camera,
) {
  // 1) Récupérer les bytes
  final Uint8List bytes =
      Platform.isAndroid
          ? _concatenatePlanes(image.planes) // YUV420 -> concat
          : image.planes.first.bytes; // iOS BGRA8888 -> 1 plan

  // 2) Renseigner les métadonnées minimales
  final metadata = InputImageMetadata(
    size: Size(image.width.toDouble(), image.height.toDouble()),
    rotation: _rotationFromSensor(camera.sensorOrientation),
    format:
        Platform.isIOS ? InputImageFormat.bgra8888 : InputImageFormat.yuv420,
    bytesPerRow: image.planes.first.bytesPerRow,
  );

  // 3) Construire l'InputImage
  return InputImage.fromBytes(bytes: bytes, metadata: metadata);
}

/// Concatène les 3 plans YUV (Android)
Uint8List _concatenatePlanes(List<Plane> planes) {
  final WriteBuffer allBytes = WriteBuffer();
  for (final Plane p in planes) {
    allBytes.putUint8List(p.bytes);
  }
  return allBytes.done().buffer.asUint8List();
}

/// Map de l’orientation capteur -> rotation ML Kit
InputImageRotation _rotationFromSensor(int sensorOrientation) {
  switch (sensorOrientation) {
    case 0:
      return InputImageRotation.rotation0deg;
    case 90:
      return InputImageRotation.rotation90deg;
    case 180:
      return InputImageRotation.rotation180deg;
    case 270:
      return InputImageRotation.rotation270deg;
    default:
      return InputImageRotation.rotation0deg;
  }
}
