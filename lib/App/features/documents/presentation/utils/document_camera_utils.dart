// ignore_for_file: deprecated_member_use

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Dessine la bordure du cadrant
class DocumentFramePainter extends CustomPainter {
  final Rect r;
  DocumentFramePainter(this.r);

  @override
  void paint(Canvas canvas, Size size) {
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
