// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;
import 'package:push_kyc/app/core/extension/context_extension.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/enums.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/take_id_camera_options.dart';

import '../utils/document_camera_utils.dart';

class TakeIdCamera extends StatefulWidget {
  const TakeIdCamera({super.key, required this.takeIdCameraOptions});
  final TakeIdCameraOptions takeIdCameraOptions;
  static String name = 'TAKE_ID_CAMERA';
  @override
  State<TakeIdCamera> createState() => _TakeIdCameraState();
}

class _TakeIdCameraState extends State<TakeIdCamera> {
  late CameraController _controller;
  late Future<void> _initFuture;

  // Ce rect est en coordonnées *widget* (écran)
  Rect? _frameRectOnScreen;

  @override
  void initState() {
    super.initState();
    _initFuture = _initCamera();
  }

  Future<void> _initCamera() async {
    final cams = await availableCameras();
    final cam = cams.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.back,
      orElse: () => cams.first,
    );
    _controller = CameraController(
      cam,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg, // pour un jpg plein
    );
    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String instructionText(TypeId type) {
    switch (type) {
      case TypeId.ID_CARD:
        return "Veuillez placer votre carte d’identité à l’intérieur du cadre et prendre une photo nette.";
      case TypeId.PASSEPORT:
        return "Veuillez ouvrir votre passeport à la page de la photo et le placer dans le cadre pour la prise.";
      case TypeId.DRIVER_LICENSE:
        return "Veuillez placer votre permis de conduire à l’intérieur du cadre et prendre une photo nette.";
      case TypeId.RESIDENCE_PERMIT:
        return "Veuillez placer votre titre de séjour à l’intérieur du cadre et prendre une photo claire.";
    }
  }

  bool _capturing = false;

  Future<File?> _onCapture() async {
    if (!_controller.value.isInitialized) return null;
    if (_capturing) return null; // évite double-tap

    setState(() {
      _capturing = true;
    });

    try {
      // Verrouiller l’orientation pour stabiliser la capture
      try {
        await _controller.lockCaptureOrientation();
      } catch (_) {}

      // Prendre la photo
      final shot = await _controller.takePicture();
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
        await _controller.unlockCaptureOrientation();
      } catch (_) {}
      setState(() {
        _capturing = false;
      });
    }
  }

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
            const double radius = 8;
            final screenSize = Size(
              constraints.maxWidth,
              constraints.maxHeight,
            );
            // Définir un cadrant 16:9 (ou carte 85.6x54mm -> ratio ~1.585)
            final double frameW = screenSize.width * 0.86;
            final double frameH =
                (widget.takeIdCameraOptions.typeId == TypeId.PASSEPORT)
                    ? 450
                    : frameW / 1.585; // ratio carte d'identité
            final Rect frameRect = Rect.fromCenter(
              center: Offset(screenSize.width / 2, screenSize.height * 0.58),
              width: frameW,
              height: frameH,
            );
            _frameRectOnScreen = frameRect;

            return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  // 1) Camera plein écran
                  Positioned.fill(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.previewSize!.height, // inversé
                        height: _controller.value.previewSize!.width,
                        child: CameraPreview(_controller),
                      ),
                    ),
                  ),

                  // 2) Overlay assombri + blur (en dehors du cadrant)
                  Positioned.fill(
                    child: DocumentBlurDarkOverlay(
                      radius: radius,
                      frameRect: frameRect,
                      blurSigma: 8,
                    ),
                  ),

                  // 3) Bordure blanche du cadrant (coins arrondis)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: CustomPaint(
                        painter: DocumentFramePainter(frameRect),
                      ),
                    ),
                  ),

                  // 4) Bouton capture
                  Positioned(
                    bottom: 32,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            width: 8,
                            color: AppTheme.kAccent,
                          ),
                        ),

                        onPressed: () async {
                          final file = await _onCapture();

                          context.pop(file);
                        },
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
                            color: Colors.grey.shade400,
                          ),
                        ),
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
                            Icon(
                              widget.takeIdCameraOptions.icon,
                              size: 50,
                              color: Colors.white,
                            ),
                            const Gap(20),
                            Text(
                              instructionText(
                                widget.takeIdCameraOptions.typeId,
                              ),
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

                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,

                    child:
                        _capturing
                            ? const CupertinoActivityIndicator(
                              radius: 40,
                              color: Colors.white,
                            )
                            : const SizedBox.shrink(),
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
