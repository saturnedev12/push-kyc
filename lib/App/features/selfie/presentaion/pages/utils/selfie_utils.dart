// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import 'package:push_kyc/app/core/network/utils/easy_loading_handler.dart';
import 'package:push_kyc/app/features/selfie/presentaion/pages/utils/face_detection_utils.dart';

/// Gère l'initialisation caméra, le flux d'images, la détection de visage,
/// la capture, le switch de caméra et le nettoyage.
class SelfieUtils {
  /// Contrôleur caméra (toujours vérifier .value.isInitialized avant usage).
  CameraController? _controller;
  CameraController get controller => _controller!;

  /// Détecteur de visage MLKit.
  FaceDetector? _faceDetector;

  /// Liste des caméras disponibles.
  List<CameraDescription> _cameras = [];
  int _camIndex = 0;

  /// États internes
  bool _isDetecting = false;
  bool _switching = false;

  /// 0 = aucun visage, 1 = un visage, 2 = plusieurs visages
  int detectionState = 0;

  /// Couleur de cadre (exposée à l’UI)
  final ValueNotifier<Color> frameColor = ValueNotifier<Color>(Colors.white);

  /// Future d'init pour utiliser dans un FutureBuilder côté UI.
  late final Future<void> initFuture = _initialize();

  /// Initialise caméras + contrôleur (caméra frontale si dispo) + faceDetector + flux.
  Future<void> _initialize() async {
    // 1) Caméras
    _cameras = await availableCameras();

    // Choix caméra frontale par défaut, sinon index 0.
    final int frontIndex = _cameras.indexWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
    );
    _camIndex = frontIndex >= 0 ? frontIndex : 0;

    // 2) Controller
    await _createAndInitController(_cameras[_camIndex]);

    // 3) Face detector
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableClassification: true,
      ),
    );

    // 4) Démarre le flux d'images avec détection
    _startImageStream();
  }

  Future<void> _createAndInitController(CameraDescription desc) async {
    // Nettoie l'ancien contrôleur si présent
    if (_controller != null) {
      try {
        await _controller!.dispose();
      } catch (_) {}
    }
    _controller = CameraController(
      desc,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await _controller!.initialize();
  }

  void _startImageStream() {
    final ctrl = _controller;
    final detector = _faceDetector;
    if (ctrl == null || detector == null) return;
    if (!ctrl.value.isInitialized) return;

    ctrl.startImageStream((image) async {
      if (_isDetecting) return;
      _isDetecting = true;

      try {
        final faces = await detector.processImage(
          cameraImageToInputImage(image, ctrl.description),
        );

        if (faces.length == 1) {
          if (detectionState != 1) {
            detectionState = 1;
            log("✅ Un seul visage détecté", name: 'Face Detection');
            EasyLoadingHandler.showToast(
              '✅ Un  visage détecté',
              toastPosition: EasyLoadingToastPosition.top,
              color: Colors.green,
            );
            frameColor.value = Colors.green;
          }
        } else if (faces.isEmpty) {
          if (detectionState != 0) {
            detectionState = 0;
            log("❌ Aucun visage détecté", name: 'Face Detection');
            EasyLoadingHandler.showToast(
              "❌ Aucun visage détecté",
              toastPosition: EasyLoadingToastPosition.top,
              color: Colors.red,
            );
            frameColor.value = Colors.red;
          }
        } else {
          if (detectionState != 2) {
            detectionState = 2;
            log("⚠️ Plusieurs visages détectés", name: 'Face Detection');
            EasyLoadingHandler.showToast(
              "⚠️ Plusieurs visages détectés",
              toastPosition: EasyLoadingToastPosition.top,
              color: Colors.orange,
            );
            frameColor.value = Colors.orange;
          }
        }
      } catch (e) {
        log(e.toString(), name: 'Face Detection Error');
      } finally {
        _isDetecting = false;
      }
    });
  }

  /// Capture une photo. Retourne le fichier ou null si échec.
  Future<File?> capture() async {
    final ctrl = _controller;
    if (ctrl == null || !ctrl.value.isInitialized) return null;

    try {
      try {
        await ctrl.lockCaptureOrientation();
      } catch (_) {}

      final shot = await ctrl.takePicture();
      return File(shot.path);
    } on CameraException catch (e) {
      debugPrint('CameraException: ${e.code} ${e.description}');
      return null;
    } catch (e) {
      debugPrint('Capture error: $e');
      return null;
    } finally {
      try {
        await ctrl.unlockCaptureOrientation();
      } catch (_) {}
    }
  }

  /// Bascule entre caméra avant/arrière si possible.
  Future<void> switchCamera() async {
    if (_cameras.length < 2 || _switching) return;
    _switching = true;

    try {
      final ctrl = _controller;
      if (ctrl != null) {
        try {
          await ctrl.stopImageStream();
        } catch (_) {}
      }

      // Détermine l’autre direction
      final current = _cameras[_camIndex].lensDirection;
      final targetDirection =
          current == CameraLensDirection.front
              ? CameraLensDirection.back
              : CameraLensDirection.front;

      final nextIndex = _cameras.indexWhere(
        (c) => c.lensDirection == targetDirection,
      );
      _camIndex =
          nextIndex >= 0 ? nextIndex : ((_camIndex + 1) % _cameras.length);

      await _createAndInitController(_cameras[_camIndex]);
      _startImageStream();
    } finally {
      _switching = false;
    }
  }

  /// Libère proprement les ressources.
  Future<void> dispose() async {
    try {
      if (_controller != null) {
        try {
          await _controller!.stopImageStream();
        } catch (_) {}
        await _controller!.dispose();
      }
    } catch (_) {}

    try {
      await _faceDetector?.close();
    } catch (_) {}

    frameColor.dispose();
  }
}
