// ignore_for_file: deprecated_member_use

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Dessine la bordure du cadrant
class DocumentFramePainter extends CustomPainter {
  final Rect r;
  DocumentFramePainter(this.r);

  @override
  void paint(Canvas canvas, Size size) {
    const corner = 26.0;
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
  bool shouldRepaint(covariant DocumentFramePainter oldDelegate) =>
      oldDelegate.r != r;
}

/// Overlay flou + sombre en dehors du cadrant (trou au centre)
class DocumentBlurDarkOverlay extends StatelessWidget {
  final Rect frameRect;
  final double blurSigma;
  final double radius;
  const DocumentBlurDarkOverlay({
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
        Path()..addRRect(RRect.fromRectAndRadius(r, Radius.circular(radius)));
    // on garde *l'extérieur* en soustrayant l’intérieur
    return Path.combine(PathOperation.difference, outer, inner);
  }

  @override
  bool shouldReclip(covariant _OutsideClipper oldClipper) => oldClipper.r != r;
}

class DocumentMapping {
  final double scale;
  final double dx;
  final double dy;
  final double imagePaintWidth;
  final double imagePaintHeight;
  DocumentMapping(
    this.scale,
    this.dx,
    this.dy,
    this.imagePaintWidth,
    this.imagePaintHeight,
  );
}

DocumentMapping documentComputeCoverMapping({
  required Size imageSize,
  required Size widgetSize,
}) {
  final imgW = imageSize.width <= 0 ? 1.0 : imageSize.width;
  final imgH = imageSize.height <= 0 ? 1.0 : imageSize.height;
  final boxW = widgetSize.width <= 0 ? 1.0 : widgetSize.width;
  final boxH = widgetSize.height <= 0 ? 1.0 : widgetSize.height;

  final imgAR = imgW / imgH;
  final boxAR = boxW / boxH;

  late double scale, paintW, paintH;
  if (imgAR > boxAR) {
    scale = boxH / imgH;
    paintH = boxH;
    paintW = imgW * scale;
  } else {
    scale = boxW / imgW;
    paintW = boxW;
    paintH = imgH * scale;
  }

  double fix(double v) => (v.abs() < 1e-10) ? 0.0 : v;
  final dx = fix((boxW - paintW) / 2.0);
  final dy = fix((boxH - paintH) / 2.0);

  return DocumentMapping(fix(scale), dx, dy, fix(paintW), fix(paintH));
}

// Future<File?> _onCapture() async {
//   if (!_controller.value.isInitialized || _frameRectOnScreen == null)
//     return null;
//   if (_capturing) return null; // évite double-tap
//   setState(() {
//     _capturing = true;
//   });

//   try {
//     // 1) Stabiliser la session: orientation + (optionnel) pausePreview
//     try {
//       await _controller.lockCaptureOrientation();
//     } catch (_) {}
//     // try { await _controller.pausePreview(); } catch (_) {} // dispo selon versions

//     // 2) Prise de vue plein capteur
//     final shot = await _controller.takePicture();
//     if (!mounted) return null;

//     final rawFile = File(shot.path);
//     final rawBytes = await rawFile.readAsBytes();

//     // 3) Décoder + normaliser orientation EXIF (important sur Android)
//     final decoded0 = img.decodeImage(rawBytes);
//     if (decoded0 == null) return null;
//     final decoded = img.bakeOrientation(decoded0);

//     // 4) Tailles preview (corrigées en portrait) + taille widget
//     final pSize = _controller.value.previewSize;
//     final isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;

//     final Size previewLogical =
//         (pSize == null)
//             ? Size(decoded.width.toDouble(), decoded.height.toDouble())
//             : (isPortrait
//                 ? Size(pSize.height, pSize.width) // inversion en portrait
//                 : Size(pSize.width, pSize.height));

//     final Size widgetSize =
//         (context.findRenderObject() as RenderBox?)?.size ??
//         MediaQuery.of(context).size;

//     // 5) Mapping cover (comment CameraPreview remplit le widget)
//     final m = documentComputeCoverMapping(
//       imageSize: previewLogical,
//       widgetSize: widgetSize,
//     );

//     // 6) Cadre écran -> coords dans l’image peinte (preview)
//     final Rect frameInPreviewImage = Rect.fromLTWH(
//       (_frameRectOnScreen!.left - m.dx) / m.scale,
//       (_frameRectOnScreen!.top - m.dy) / m.scale,
//       _frameRectOnScreen!.width / m.scale,
//       _frameRectOnScreen!.height / m.scale,
//     );

//     // 7) Preview -> pixels de la photo finale
//     final double sx = decoded.width / m.imagePaintWidth;
//     final double sy = decoded.height / m.imagePaintHeight;

//     final Rect frameInFullImage = Rect.fromLTWH(
//       frameInPreviewImage.left * sx,
//       frameInPreviewImage.top * sy,
//       frameInPreviewImage.width * sx,
//       frameInPreviewImage.height * sy,
//     );

//     // 8) Clamp dans les bornes
//     int x = frameInFullImage.left.clamp(0, decoded.width - 1).toInt();
//     int y = frameInFullImage.top.clamp(0, decoded.height - 1).toInt();
//     int w = frameInFullImage.width.clamp(1, decoded.width - x).toInt();
//     int h = frameInFullImage.height.clamp(1, decoded.height - y).toInt();
//     if (w <= 1 || h <= 1) return null;

//     // 9) Crop
//     final cropped = img.copyCrop(decoded, x: x, y: y, width: w, height: h);

//     // 10) Sauvegarde
//     final base = rawFile.path.replaceFirst(
//       RegExp(r'\.(jpe?g|png|webp)$', caseSensitive: false),
//       '',
//     );
//     final outPath = '${base}_cropped.jpg';
//     final outFile = File(outPath);
//     await outFile.writeAsBytes(
//       img.encodeJpg(cropped, quality: 95),
//       flush: true,
//     );

//     // 11) (optionnel) reprendre la preview
//     // try { await _controller.resumePreview(); } catch (_) {}
//     return outFile;
//   } on CameraException catch (e) {
//     // utile pour remonter des erreurs "capture failed / closed"
//     debugPrint('CameraException: ${e.code} ${e.description}');
//     return null;
//   } catch (e) {
//     debugPrint('Capture error: $e');
//     return null;
//   } finally {
//     try {
//       await _controller.unlockCaptureOrientation();
//     } catch (_) {}
//     setState(() {
//       _capturing = false;
//     });
//   }
// }
