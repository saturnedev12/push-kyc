// tale_id_card_page.dart
// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/config/injection.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/source_file_popup.dart';
import 'package:push_kyc/app/features/local_storage/data/repositories/kyc_doc_local_repository.dart';
import 'package:push_kyc/app/features/selfie/presentaion/pages/take_selfie_page.dart';

class TakePasseportPage extends StatefulWidget {
  const TakePasseportPage({super.key});
  static String name = 'TAKE_PASSEPORT';

  @override
  State<TakePasseportPage> createState() => _TakePasseportPageState();
}

class _TakePasseportPageState extends State<TakePasseportPage> {
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
                          label: 'Photo de votre passeport',
                          uploading: uploadingFront,
                          kycDocState: state,
                          onTap: () async {
                            setState(() => uploadingFront = !uploadingFront);
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
                              builder: (_) => const SourceFilePopup(),
                            ).then((value) {
                              if (value is File) {
                                context.read<KycDocCubit>().setPassport(
                                  value.path,
                                );
                                // context.pop(value);
                              }
                            });

                            setState(() => uploadingFront = !uploadingFront);
                          },
                          icon: FontAwesomeIcons.passport,
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
              selector: (stat) => stat.pathPassport != null,
              builder: (context, hasType) {
                final cubit = context.read<KycDocCubit>();
                bool alreadyStarted = cubit.state.alreadyStarted;

                return ElevatedButton(
                  onPressed:
                      hasType
                          ? () async {
                            await getIt<KycDocLocalRepository>().save(
                              cubit.state,
                            );
                            if (alreadyStarted) {
                              context.pop(true);
                            } else {
                              context.pushNamed(TakeSelfiePage.name);
                            }
                          }
                          : null,
                  child: Text(alreadyStarted ? 'Terminer' : 'Continuer'),
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
    required KycDocState kycDocState,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: const RoundedRectDottedBorderOptions(
          color: Colors.grey,
          strokeWidth: 1.5,
          dashPattern: [6, 4],
          radius: Radius.circular(16),
        ),

        child:
            (kycDocState.pathPassport != null)
                ? SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // arrondi de 16px (tu peux ajuster)
                    child: Image.file(
                      File(kycDocState.pathPassport!),
                      fit: BoxFit.cover, // adapte l’image au conteneur
                    ),
                  ),
                )
                : Container(
                  height: 400,
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
