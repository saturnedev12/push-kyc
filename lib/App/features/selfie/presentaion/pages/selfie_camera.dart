// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/App/core/extension/context_extension.dart';

import 'utils/selfie_screen_utils.dart'; // flutter pub add image

class SelfieCamera extends StatefulWidget {
  const SelfieCamera({super.key});
  static String name = 'SELFIE_SCREEN';
  @override
  State<SelfieCamera> createState() => _SelfieCameraState();
}

class _SelfieCameraState extends State<SelfieCamera> {
  late CameraController _controller;
  late Future<void> _initFuture;

  List<CameraDescription> _cams = const [];
  int _camIndex = 0; // sera défini au front si dispo
  bool _switching = false;

  Rect? _frameRectOnScreen;

  Future<void> _initCamera({bool firstTime = false}) async {
    if (firstTime) {
      _cams = await availableCameras();

      // Choisir la frontale par défaut si dispo (selfie)
      final frontIdx = _cams.indexWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
      );
      _camIndex = frontIdx >= 0 ? frontIdx : 0;
    }

    final cam = _cams[_camIndex];
    _controller = CameraController(
      cam,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    await _controller.initialize();
  }

  Future<void> _switchCamera() async {
    if (_cams.length < 2 || _switching) return;
    setState(() => _switching = true);

    try {
      await _controller.dispose();
      // alterne entre avant/arrière
      // on tente en priorité le "front" si on n’y est pas, sinon l’autre
      final nextIndex = _cams.indexWhere(
        (c) =>
            (_cams[_camIndex].lensDirection == CameraLensDirection.front)
                ? c.lensDirection == CameraLensDirection.back
                : c.lensDirection == CameraLensDirection.front,
      );
      _camIndex = nextIndex >= 0 ? nextIndex : ((_camIndex + 1) % _cams.length);

      await _initCamera();
      if (mounted) setState(() {});
    } finally {
      if (mounted) setState(() => _switching = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _initFuture = _initCamera(firstTime: true);
  }

  @override
  void dispose() {
    _controller.dispose();
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
                    child: SelfieBlurDarkOverlay(
                      frameRect: frameRect,
                      blurSigma: 8,
                    ),
                  ),

                  // 3) Bordure blanche du cadrant (coins arrondis)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: CustomPaint(
                        painter: SelfieFramePainter(frameRect),
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
                          shape: CircleBorder(),
                          side: BorderSide(width: 8, color: Colors.blue),
                        ),

                        onPressed: () async {
                          final file = await onCapture(
                            context: context,
                            controller: _controller,
                            frameRectOnScreen: _frameRectOnScreen,
                            state: this,
                          );

                          context.pop(file);
                        },
                        child: Container(
                          width: 74,
                          height: 74,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 6),
                          ),
                          child: Icon(FontAwesomeIcons.camera, size: 30),
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
                            Icon(
                              FontAwesomeIcons.imagePortrait,
                              size: 50,
                              color: Colors.white,
                            ),
                            Gap(20),
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
