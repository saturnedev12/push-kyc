// tale_id_card_page.dart
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/App/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/App/features/documents/presentation/pages/source_file_popup.dart';

class TakleIdCardPage extends StatefulWidget {
  const TakleIdCardPage({super.key});
  static String name = 'TAKE_ID';

  @override
  State<TakleIdCardPage> createState() => _TakleIdCardPageState();
}

class _TakleIdCardPageState extends State<TakleIdCardPage> {
  bool uploadingFront = false;
  bool uploadingBack = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Carte d’identité')),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Téléversement de la pièce',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        _fileBox(
                          label: 'Recto de la pièce',
                          imagePath: state.pathRecto,
                          uploading: uploadingFront,
                          onTap: () async {
                            setState(() => uploadingFront = true);
                            await showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              isScrollControlled: true,
                              // showDragHandle: true,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22),
                                ),
                              ),
                              builder: (_) => SourceFilePopup(),
                            ).then((value) {
                              if (value is File) {
                                context.read<KycDocCubit>().setRecto(
                                  value.path,
                                );
                                setState(() => uploadingFront = false);
                                // context.pop(value);
                              }
                            });

                            setState(() => uploadingFront = false);
                          },
                          icon: FontAwesomeIcons.idCard,
                        ),
                        Gap(30),
                        _fileBox(
                          label: 'Verso de la pièce',
                          imagePath: state.pathVerso,
                          uploading: uploadingBack,
                          onTap: () async {
                            setState(() => uploadingBack = !uploadingBack);
                            await showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              isScrollControlled: true,
                              // showDragHandle: true,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22),
                                ),
                              ),
                              builder: (_) => SourceFilePopup(),
                            ).then((value) {
                              if (value is File) {
                                context.read<KycDocCubit>().setVerso(
                                  value.path,
                                );
                                setState(() => uploadingBack = false);
                              }
                            });
                            setState(() => uploadingBack = false);
                          },
                          icon: FontAwesomeIcons.rectangleList,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ).copyWith(bottom: 15),
            height: 80,
            child: BlocSelector<KycDocCubit, KycDocState, bool>(
              selector:
                  (stat) => (stat.pathRecto != null && stat.pathVerso != null),
              builder: (context, hasType) {
                return ElevatedButton(
                  onPressed:
                      hasType
                          ? () {
                            log('Continuer');
                          }
                          : null,
                  child: const Text('Continuer'),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _fileBox({
    required String label,
    required bool uploading,
    required VoidCallback onTap,
    required IconData icon,
    required String? imagePath,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: Colors.grey,
          strokeWidth: 1.5,
          dashPattern: const [6, 4],
          radius: const Radius.circular(16),
        ),

        child:
            (imagePath != null)
                ? SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // arrondi de 16px (tu peux ajuster)
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover, // adapte l’image au conteneur
                    ),
                  ),
                )
                : Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child:
                        uploading
                            ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Téléversement en cours...",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  icon,
                                  size: 32,
                                  color: Colors.grey.shade600,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  label,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Taille max: 30MB",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                  ),
                ),
      ),
    );
  }
}
