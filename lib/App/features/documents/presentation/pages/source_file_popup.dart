// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/enums.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/select_and_crop_from_gallery.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/take_id_camera_options.dart';

import 'take_id_camera.dart';

class SourceFilePopup extends StatelessWidget {
  const SourceFilePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<KycDocCubit, KycDocState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ajouter un fichier',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.solidCircleXmark),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _PickerTile(
                title: 'Prendre une photo',
                subtitle: 'Ouvrir l’appareil photo',
                icon: FontAwesomeIcons.camera,
                onTap: () {
                  print('Source: camera');
                  context
                      .pushNamed(
                        TakeIdCamera.name,
                        extra: TakeIdCameraOptions(
                          icon:
                              state.typeChoisi == TypeId.PASSEPORT
                                  ? FontAwesomeIcons.passport
                                  : FontAwesomeIcons
                                      .idCard, //FontAwesomeIcons.rectangleList,
                          title: 'Une photo de votre pièce',
                          typeId: state.typeChoisi ?? TypeId.ID_CARD,
                        ),
                      )
                      .then((value) {
                        if (value is File) {
                          context.pop(value);
                        }
                      });
                },
              ),
              const SizedBox(height: 12),
              _PickerTile(
                title: 'Depuis vos fichiers',
                subtitle: 'Choisir un fichier existant',
                icon: FontAwesomeIcons.folderOpen,
                onTap: () async {
                  print('Source: fichiers');
                  // Navigator.pop(context);
                  File? file = await pickAndCropFromGallery(
                    context,
                    // aspectRatio: 4 / 3, // ex: CNI 4:3 ; passeport libre => null
                  );
                  context.pop(file);
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'JPG, JPEG, PNG, WEBP, TIFF • moins de 5 Mo',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Annuler'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PickerTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  const _PickerTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: Colors.black45);
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: const RoundedRectDottedBorderOptions(
          color: Color(0xFFBDBDBD),
          dashPattern: [6, 4],
          strokeWidth: 1.4,

          radius: Radius.circular(18),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F8),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: FaIcon(icon, size: 20, color: Colors.black87),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(subtitle, style: hint),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }
}
