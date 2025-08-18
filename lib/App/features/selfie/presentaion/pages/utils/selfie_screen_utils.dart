// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

/// Dessine la bordure du cadrant
class SelfieFramePainter extends CustomPainter {
  final Rect r;
  final double radius;
  final Color color;
  final double strokeWidth;

  SelfieFramePainter(
    this.r, {
    this.radius = 40, // taille du rayon de chaque coin
    this.color = Colors.white, // couleur des coins
    this.strokeWidth = 8, // épaisseur du trait
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..color = color
          ..strokeCap = StrokeCap.round;

    // Coin haut-gauche
    final rectTopLeft = Rect.fromLTWH(r.left, r.top, radius * 2, radius * 2);
    canvas.drawArc(rectTopLeft, 3.14, 1.57, false, paint);

    // Coin haut-droit
    final rectTopRight = Rect.fromLTWH(
      r.right - radius * 2,
      r.top,
      radius * 2,
      radius * 2,
    );
    canvas.drawArc(rectTopRight, 4.71, 1.57, false, paint);

    // Coin bas-gauche
    final rectBottomLeft = Rect.fromLTWH(
      r.left,
      r.bottom - radius * 2,
      radius * 2,
      radius * 2,
    );
    canvas.drawArc(rectBottomLeft, 1.57, 1.57, false, paint);

    // Coin bas-droit
    final rectBottomRight = Rect.fromLTWH(
      r.right - radius * 2,
      r.bottom - radius * 2,
      radius * 2,
      radius * 2,
    );
    canvas.drawArc(rectBottomRight, 0, 1.57, false, paint);
  }

  @override
  bool shouldRepaint(covariant SelfieFramePainter oldDelegate) =>
      oldDelegate.r != r ||
      oldDelegate.radius != radius ||
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth;
}

/// Overlay flou + sombre en dehors du cadrant (trou au centre)
class SelfieBlurDarkOverlay extends StatelessWidget {
  final Rect frameRect;
  final double blurSigma;
  final double radius;
  const SelfieBlurDarkOverlay({
    required this.frameRect,
    this.blurSigma = 6,
    super.key,
    this.radius = 40,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // On clip *l'extérieur* du cadrant (donc pas le trou)
      clipper: _OutsideClipper(frameRect, radius),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(color: Colors.black.withOpacity(0.35)),
      ),
    );
  }
}

class _OutsideClipper extends CustomClipper<Path> {
  final Rect r;
  final double radius;
  _OutsideClipper(this.r, this.radius);
  @override
  Path getClip(Size size) {
    final outer = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final inner =
        Path()..addRRect(RRect.fromRectAndRadius(r, const Radius.circular(40)));
    // on garde *l'extérieur* en soustrayant l’intérieur
    return Path.combine(PathOperation.difference, outer, inner);
  }

  @override
  bool shouldReclip(covariant _OutsideClipper oldClipper) => oldClipper.r != r;
}

class SelfieMapping {
  final double scale;
  final double dx;
  final double dy;
  final double imagePaintWidth;
  final double imagePaintHeight;
  SelfieMapping(
    this.scale,
    this.dx,
    this.dy,
    this.imagePaintWidth,
    this.imagePaintHeight,
  );
}

/// Calcule comment une image de taille imageSize est peinte pour remplir widgetSize (BoxFit.cover)
SelfieMapping selfieComputeCoverMapping({
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
  return SelfieMapping(scale, dx, dy, paintW, paintH);
}

// Bouton capture -> photo recadrée à l’intérieur du cadrant
Future<File?> onCapture({
  required CameraController controller,
  required Rect? frameRectOnScreen,
  required BuildContext context,
  required State state,
}) async {
  if (!controller.value.isInitialized || frameRectOnScreen == null) return null;

  final XFile shot = await controller.takePicture(); // photo plein capteur
  final File file = File(shot.path);
  final bytes = await file.readAsBytes();

  // 1) Charger l’image
  final img.Image? decoded = img.decodeImage(bytes);
  if (decoded == null) return null;

  // 2) Calculer le mapping (widget -> image capteur)
  final Size previewSize =
      controller.value.previewSize ??
      Size(decoded.width.toDouble(), decoded.height.toDouble());
  final Size widgetSize = context.size ?? MediaQuery.of(context).size;

  final SelfieMapping m = selfieComputeCoverMapping(
    imageSize: Size(
      previewSize.height,
      previewSize.width,
    ), // souvent inversé (w/h)
    widgetSize: widgetSize,
  );

  // 3) Convertir le frame (widget) -> coords dans l’image preview
  final Rect frameInImagePreview = Rect.fromLTWH(
    (frameRectOnScreen.left - m.dx) / m.scale,
    (frameRectOnScreen.top - m.dy) / m.scale,
    frameRectOnScreen.width / m.scale,
    frameRectOnScreen.height / m.scale,
  );

  // 4) Convertir vers résolution de la photo
  final double sx = decoded.width / m.imagePaintWidth;
  final double sy = decoded.height / m.imagePaintHeight;

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

  // 6) Sauvegarder et retourner le File
  final outPath = '${file.path.replaceFirst('.jpg', '')}_cropped.jpg';
  final File outFile = File(outPath);
  await outFile.writeAsBytes(img.encodeJpg(cropped, quality: 95));

  if (state.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Image cadrée enregistrée: $outPath')),
    );
  }

  return outFile;
}
