// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:push_kyc/App/core/themes/app_theme.dart';
import 'package:push_kyc/app/core/extension/context_extension.dart';
import 'package:push_kyc/app/core/network/utils/easy_loading_handler.dart';
import 'package:push_kyc/app/features/selfie/presentaion/pages/utils/face_detection_utils.dart';
import 'package:push_kyc/app/features/selfie/presentaion/pages/utils/selfie_screen_utils.dart';

class SelfieCamera extends StatefulWidget {
  const SelfieCamera({super.key});
  static String name = 'SELFIE_SCREEN';
  @override
  State<SelfieCamera> createState() => _SelfieCameraState();
}

class _SelfieCameraState extends State<SelfieCamera> {
  CameraController? _controller;
  late FaceDetector _faceDetector;
  bool _isDetecting = false;
  Color _frameColor = Colors.white;
  List<CameraDescription> cameras = [];
  String status = "Initialisation...";
  late Future<void> _initFuture;
  @override
  void initState() {
    super.initState();
    _initFuture = _initializeCamera();
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableClassification: true,
      ),
    );
  }

  int detectionState = 0;
  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (cam) => cam.lensDirection == CameraLensDirection.front,
    );

    _controller = CameraController(frontCamera, ResolutionPreset.medium);
    await _controller!.initialize();
    _controller!.startImageStream((image) async {
      if (_isDetecting) return;
      _isDetecting = true;

      try {
        final faces = await _faceDetector.processImage(
          cameraImageToInputImage(image, _controller!.description),
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
            setState(() => _frameColor = Colors.green);
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
            setState(() => _frameColor = Colors.red);
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
            setState(() => _frameColor = Colors.orange);
          }
        }
      } catch (e) {
        log(e.toString(), name: 'Face Detection Error');
        // setState(() => status = "Erreur : $e");
      }

      _isDetecting = false;
    });
    // setState(() {});
  }

  final bool _capturing = false;

  Future<File?> _onCapture() async {
    if (!_controller!.value.isInitialized) return null;
    if (_capturing) return null; // évite double-tap

    // setState(() {
    //   _capturing = true;
    // });

    try {
      // Verrouiller l’orientation pour stabiliser la capture
      try {
        await _controller!.lockCaptureOrientation();
      } catch (_) {}

      // Prendre la photo
      final shot = await _controller!.takePicture();
      if (!mounted) return null;

      return File(shot.path);
    } on CameraException catch (e) {
      debugPrint('CameraException: ${e.code} ${e.description}');
      return null;
    } catch (e) {
      debugPrint('Capture error: $e');
      return null;
    } finally {
      try {
        await _controller!.unlockCaptureOrientation();
      } catch (_) {}
      // setState(() {
      //   _capturing = false;
      // });
    }
  }

  bool _switching = false;
  int _camIndex = 0;
  Future<void> _switchCamera() async {
    if (cameras.length < 2 || _switching) return;
    setState(() => _switching = true);

    try {
      await _controller!.dispose();
      // alterne entre avant/arrière
      // on tente en priorité le "front" si on n’y est pas, sinon l’autre
      final nextIndex = cameras.indexWhere(
        (c) =>
            (cameras[_camIndex].lensDirection == CameraLensDirection.front)
                ? c.lensDirection == CameraLensDirection.back
                : c.lensDirection == CameraLensDirection.front,
      );
      _camIndex =
          nextIndex >= 0 ? nextIndex : ((_camIndex + 1) % cameras.length);

      await _initializeCamera();
      if (mounted) setState(() {});
    } finally {
      if (mounted) setState(() => _switching = false);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _faceDetector.close();
    super.dispose();
  }

  // Bouton capture -> photo recadrée à l’intérieur du cadrant

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            final screenSize = Size(
              constraints.maxWidth,
              constraints.maxHeight,
            );
            // Définir un cadrant 16:9 (ou carte 85.6x54mm -> ratio ~1.585)
            final double frameW = screenSize.width * 0.86;
            final double frameH = frameW + 100; // ratio carte d'identité
            final Rect frameRect = Rect.fromCenter(
              center: Offset(screenSize.width / 2, screenSize.height * 0.58),
              width: frameW,
              height: frameH,
            );

            return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  // 1) Camera plein écran
                  Positioned.fill(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width:
                            _controller!.value.previewSize!.height, // inversé
                        height: _controller!.value.previewSize!.width,
                        child: CameraPreview(_controller!),
                      ),
                    ),
                  ),

                  // 2) Overlay assombri + blur (en dehors du cadrant)
                  Positioned.fill(
                    child: SelfieBlurDarkOverlay(
                      frameRect: frameRect,
                      blurSigma: 8,
                    ),
                  ),

                  // 3) Bordure blanche du cadrant (coins arrondis)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: CustomPaint(
                        painter: SelfieFramePainter(
                          frameRect,
                          color: _frameColor,
                        ),
                      ),
                    ),
                  ),

                  // 4) Bouton capture
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,

                          side: BorderSide(width: 8, color: _frameColor),
                        ),

                        // onPressed: () async {
                        //   final file = await onCapture(
                        //     context: context,
                        //     controller: _controller,
                        //     frameRectOnScreen: _frameRectOnScreen,
                        //     state: this,
                        //   );

                        //   context.pop(file);
                        // },
                        onPressed:
                            (_frameColor == Colors.green)
                                ? () async {
                                  final file = await _onCapture();
                                  if (file != null) {
                                    context.pop(file);
                                  }
                                }
                                : null,
                        child: Container(
                          width: 74,
                          height: 74,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 6),
                          ),
                          child: Icon(
                            FontAwesomeIcons.camera,
                            size: 30,
                            color: _frameColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 5) BOUTON SWITCH CAMERA (en haut à droite)
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 12,
                    right: 12,
                    child: Material(
                      color: Colors.black.withOpacity(0.35),
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                        onPressed: _switchCamera,
                        icon: const FaIcon(
                          FontAwesomeIcons.cameraRotate,
                          size: 18,
                          color: Colors.white,
                        ),
                        tooltip: 'Changer de caméra',
                      ),
                    ),
                  ),

                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            const Icon(
                              FontAwesomeIcons.imagePortrait,
                              size: 50,
                              color: Colors.white,
                            ),
                            const Gap(20),
                            Text(
                              'Centrer votre visage dans le cadre pour prendre le selfie',
                              textAlign: TextAlign.center,
                              style: context.textTheme.titleSmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
