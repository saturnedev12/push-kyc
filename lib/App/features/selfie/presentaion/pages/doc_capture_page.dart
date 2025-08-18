import 'dart:io';
import 'dart:ui' as ui;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; // flutter pub add image

class DocCapturePage extends StatefulWidget {
  const DocCapturePage({super.key});

  @override
  State<DocCapturePage> createState() => _DocCapturePageState();
}

class _DocCapturePageState extends State<DocCapturePage> {
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

  // Bouton capture -> photo recadrée à l’intérieur du cadrant
  Future<void> _onCapture() async {
    if (!_controller.value.isInitialized || _frameRectOnScreen == null) return;
    final XFile shot = await _controller.takePicture(); // photo plein capteur
    final File file = File(shot.path);
    final bytes = await file.readAsBytes();

    // 1) Charger l’image
    final img.Image? decoded = img.decodeImage(bytes);
    if (decoded == null) return;

    // 2) Calculer le mapping (widget -> image capteur)
    //    on déduit comment CameraPreview a "letterbox/zoomé" l’image.
    final Size previewSize =
        _controller.value.previewSize ??
        Size(decoded.width.toDouble(), decoded.height.toDouble());
    final Size widgetSize = context.size ?? MediaQuery.of(context).size;

    // CameraPreview utilise souvent "cover" (remplir) avec ratio du preview.
    final _Mapping m = _computeCoverMapping(
      imageSize: Size(
        previewSize.height,
        previewSize.width,
      ), // ATTENTION: sur Android, previewSize est souvent inversé (w/h)
      widgetSize: widgetSize,
    );

    // 3) Convertir le frame (widget) -> coords dans l’image preview
    final Rect frameInImagePreview = Rect.fromLTWH(
      (_frameRectOnScreen!.left - m.dx) / m.scale,
      (_frameRectOnScreen!.top - m.dy) / m.scale,
      _frameRectOnScreen!.width / m.scale,
      _frameRectOnScreen!.height / m.scale,
    );

    // 4) Convertir vers résolution de la photo (peut différer du preview)
    //    Ici, on suppose même orientation; au besoin, adaptez la rotation.
    final double sx = decoded.width / (m.imagePaintWidth);
    final double sy = decoded.height / (m.imagePaintHeight);

    final Rect frameInFullImage = Rect.fromLTWH(
      frameInImagePreview.left * sx,
      frameInImagePreview.top * sy,
      frameInImagePreview.width * sx,
      frameInImagePreview.height * sy,
    );

    // 5) Nettoyer le rect (bornes)
    int x = frameInFullImage.left.clamp(0, decoded.width - 1).toInt();
    int y = frameInFullImage.top.clamp(0, decoded.height - 1).toInt();
    int w = frameInFullImage.width.clamp(1, decoded.width - x).toInt();
    int h = frameInFullImage.height.clamp(1, decoded.height - y).toInt();

    final img.Image cropped = img.copyCrop(
      decoded,
      x: x,
      y: y,
      width: w,
      height: h,
    );

    // 6) Sauvegarder ou envoyer
    final outPath = '${file.path.replaceFirst('.jpg', '')}_cropped.jpg';
    await File(outPath).writeAsBytes(img.encodeJpg(cropped, quality: 95));
    // TODO: upload / afficher un aperçu
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image cadrée enregistrée: $outPath')),
      );
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
            final screenSize = Size(
              constraints.maxWidth,
              constraints.maxHeight,
            );
            // Définir un cadrant 16:9 (ou carte 85.6x54mm -> ratio ~1.585)
            final double frameW = screenSize.width * 0.86;
            final double frameH = frameW / 1.585; // ratio carte d'identité
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
                    child: _BlurDarkOverlay(frameRect: frameRect, blurSigma: 8),
                  ),

                  // 3) Bordure blanche du cadrant (coins arrondis)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: CustomPaint(painter: _FramePainter(frameRect)),
                    ),
                  ),

                  // 4) Bouton capture
                  Positioned(
                    bottom: 32,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: _onCapture,
                        child: Container(
                          width: 74,
                          height: 74,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 6),
                          ),
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

/// Dessine la bordure du cadrant
class _FramePainter extends CustomPainter {
  final Rect r;
  _FramePainter(this.r);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..color = Colors.white;

    final radius = 18.0;
    final path =
        Path()..addRRect(RRect.fromRectAndRadius(r, Radius.circular(radius)));
    canvas.drawPath(path, paint);

    // Petits coins (optionnel)
    final corner = 26.0;
    final cornerPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round
          ..color = Colors.white;
    // 4 coins
    canvas.drawLine(
      Offset(r.left, r.top + corner),
      Offset(r.left, r.top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(r.left, r.top),
      Offset(r.left + corner, r.top),
      cornerPaint,
    );

    canvas.drawLine(
      Offset(r.right, r.top + corner),
      Offset(r.right, r.top),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(r.right - corner, r.top),
      Offset(r.right, r.top),
      cornerPaint,
    );

    canvas.drawLine(
      Offset(r.left, r.bottom - corner),
      Offset(r.left, r.bottom),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(r.left, r.bottom),
      Offset(r.left + corner, r.bottom),
      cornerPaint,
    );

    canvas.drawLine(
      Offset(r.right, r.bottom - corner),
      Offset(r.right, r.bottom),
      cornerPaint,
    );
    canvas.drawLine(
      Offset(r.right - corner, r.bottom),
      Offset(r.right, r.bottom),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _FramePainter oldDelegate) => oldDelegate.r != r;
}

/// Overlay flou + sombre en dehors du cadrant (trou au centre)
class _BlurDarkOverlay extends StatelessWidget {
  final Rect frameRect;
  final double blurSigma;
  const _BlurDarkOverlay({
    required this.frameRect,
    this.blurSigma = 6,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // On clip *l'extérieur* du cadrant (donc pas le trou)
      clipper: _OutsideClipper(frameRect),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(color: Colors.black.withOpacity(0.35)),
      ),
    );
  }
}

class _OutsideClipper extends CustomClipper<Path> {
  final Rect r;
  _OutsideClipper(this.r);
  @override
  Path getClip(Size size) {
    final outer = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final inner =
        Path()..addRRect(RRect.fromRectAndRadius(r, const Radius.circular(18)));
    // on garde *l'extérieur* en soustrayant l’intérieur
    return Path.combine(PathOperation.difference, outer, inner);
  }

  @override
  bool shouldReclip(covariant _OutsideClipper oldClipper) => oldClipper.r != r;
}

class _Mapping {
  final double scale;
  final double dx;
  final double dy;
  final double imagePaintWidth;
  final double imagePaintHeight;
  _Mapping(
    this.scale,
    this.dx,
    this.dy,
    this.imagePaintWidth,
    this.imagePaintHeight,
  );
}

/// Calcule comment une image de taille imageSize est peinte pour remplir widgetSize (BoxFit.cover)
_Mapping _computeCoverMapping({
  required Size imageSize,
  required Size widgetSize,
}) {
  final imgAR = imageSize.width / imageSize.height;
  final widAR = widgetSize.width / widgetSize.height;
  late double scale;
  late double paintW;
  late double paintH;
  if (imgAR > widAR) {
    // l'image est plus "large" -> on ajuste hauteur
    scale = widgetSize.height / imageSize.height;
    paintH = widgetSize.height;
    paintW = imageSize.width * scale;
  } else {
    // l'image est plus "haute" -> on ajuste largeur
    scale = widgetSize.width / imageSize.width;
    paintW = widgetSize.width;
    paintH = imageSize.height * scale;
  }
  final dx = (widgetSize.width - paintW) / 2.0;
  final dy = (widgetSize.height - paintH) / 2.0;
  return _Mapping(scale, dx, dy, paintW, paintH);
}
