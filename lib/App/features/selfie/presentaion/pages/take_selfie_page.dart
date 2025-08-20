// take_selfie_page.dart
// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/config/injection.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/features/home/presentation/pages/home_page.dart';
import 'package:push_kyc/app/features/local_storage/data/repositories/kyc_doc_local_repository.dart';
import 'package:push_kyc/app/features/selfie/presentaion/pages/selfie_camera.dart';

class TakeSelfiePage extends StatefulWidget {
  const TakeSelfiePage({super.key});
  static String name = 'TAKE_SELFIE';

  @override
  State<TakeSelfiePage> createState() => _TakeSelfiePageState();
}

class _TakeSelfiePageState extends State<TakeSelfiePage> {
  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Selfie')),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Photo de selfie',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Assurez-vous d’être bien éclairé, retirez vos lunettes et regardez droit devant. Votre visage doit être entièrement visible dans le cadre.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                const SliverGap(20),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  sliver: SliverToBoxAdapter(
                    child: _fileBox(
                      label: 'Prendre un selfie',
                      uploading: uploading,
                      kycDocState: state,
                      onTap: () async {
                        setState(() => uploading = true);

                        await context.pushNamed(SelfieCamera.name).then((
                          value,
                        ) {
                          if (value is File) {
                            context.read<KycDocCubit>().setSelfie(value.path);
                          }
                        });

                        setState(() => uploading = false);
                      },
                      icon: FontAwesomeIcons.userLarge,
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
              selector: (s) => s.pathSelfie != null,
              builder: (context, ok) {
                final cubit = context.read<KycDocCubit>();

                return ElevatedButton(
                  onPressed:
                      ok
                          ? () async {
                            await getIt<KycDocLocalRepository>().save(
                              cubit.state,
                            );
                            log('Continuer');
                            context.goNamed(HomePage.name);
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
    required KycDocState kycDocState,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: const RoundedRectDottedBorderOptions(
          color: Colors.grey,
          strokeWidth: 1.5,
          dashPattern: [6, 4],
          radius: Radius.circular(60),
        ),
        child:
            (kycDocState.pathSelfie != null)
                ? SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.file(
                      File(kycDocState.pathSelfie!),
                      fit: BoxFit.cover,
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
                                  size: 34,
                                  color: Colors.grey.shade600,
                                ),
                                const SizedBox(height: 10),
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
