// image_crop_helper.dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:path_provider/path_provider.dart';

/// Ouvre la galerie, puis affiche une page de recadrage.
/// Retourne un File (image recadrée) ou null si annulé.
Future<File?> pickAndCropFromGallery(
  BuildContext context, {
  double? aspectRatio, // ex: 1, 4/3, 3/4...
}) async {
  final picker = ImagePicker();
  final picked = await picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 95,
  );
  if (picked == null) return null;

  final bytes = await picked.readAsBytes();

  // on récupère les bytes recadrés (ou null si l’utilisateur annule)
  final Uint8List? croppedBytes = await Navigator.of(context).push(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => _CropPage(imageBytes: bytes, aspectRatio: aspectRatio),
    ),
  );

  if (croppedBytes == null) return null;

  final dir = await getTemporaryDirectory();
  final path = '${dir.path}/crop_${DateTime.now().millisecondsSinceEpoch}.jpg';
  final file = File(path);
  await file.writeAsBytes(croppedBytes, flush: true);
  return file;
}

class _CropPage extends StatefulWidget {
  final Uint8List imageBytes;
  final double? aspectRatio;
  const _CropPage({required this.imageBytes, this.aspectRatio});

  @override
  State<_CropPage> createState() => _CropPageState();
}

class _CropPageState extends State<_CropPage> {
  final _controller = CropController();
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: const Text('Annuler'),
        ),
        title: const Text('Recadrer la photo'),
        actions: [
          TextButton(
            onPressed:
                _busy
                    ? null
                    : () {
                      setState(() => _busy = true);
                      _controller
                          .crop(); // lance le crop (résultat via onCropped)
                    },
            child: const Text('Valider'),
          ),
        ],
      ),
      body: Stack(
        children: [
          Crop(
            controller: _controller,
            image: widget.imageBytes,
            aspectRatio: widget.aspectRatio,
            // Remplace initialSize par initialRectBuilder (API 2.x)
            initialRectBuilder: InitialRectBuilder.withSizeAndRatio(
              size: 0.9,
              aspectRatio: widget.aspectRatio,
            ),
            interactive: true,
            baseColor: Colors.black,
            maskColor: Colors.black.withOpacity(0.65),
            onCropped: (result) {
              setState(() => _busy = false);
              // onCropped fournit maintenant un CropResult (2.x)
              if (result is CropSuccess) {
                Navigator.pop(context, result.croppedImage);
              } else if (result is CropFailure) {
                // tu peux afficher un message d’erreur si tu veux
                Navigator.pop(context, null);
              }
            },
          ),
          if (_busy)
            Container(
              color: Colors.black26,
              alignment: Alignment.center,
              child: const SizedBox(
                width: 36,
                height: 36,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        ],
      ),
    );
  }
}
