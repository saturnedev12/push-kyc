// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:push_kyc/app/core/config/injection.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/network/utils/easy_loading_handler.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/home/presentation/components/header_action.dart';
import 'package:push_kyc/app/features/local_storage/data/repositories/kyc_doc_local_repository.dart';

class DashboardTableActions extends StatelessWidget {
  const DashboardTableActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.folder_badge_person_crop,
                color: AppTheme.kPrimary,
              ),
              const SizedBox(width: 8),
              const Text(
                'Sections KYC',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              HeaderAction(
                icon: CupertinoIcons.slider_horizontal_3,
                label: 'Filtrer',
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HeaderAction(
                iconColor: CupertinoColors.systemRed,
                borderColor: CupertinoColors.systemRed,
                labelColor: Colors.red,
                icon: CupertinoIcons.trash,
                label: 'Annuler',
                onTap: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder:
                        (ctx) => CupertinoAlertDialog(
                          title: const Text('Confirmation'),
                          content: const Text(
                            'Êtes-vous sûr de vouloir annuler et supprimer toutes les données KYC ? Cette action est irréversible.',
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text('Annuler'),
                              onPressed: () => Navigator.of(ctx).pop(false),
                            ),
                            CupertinoDialogAction(
                              isDestructiveAction: true,
                              child: const Text('Supprimer'),
                              onPressed: () => Navigator.of(ctx).pop(true),
                            ),
                          ],
                        ),
                  );

                  if (confirmed == true) {
                    await EasyLoadingHandler.showLoagingToast(
                      text: 'Suppression...',
                    );
                    context.read<KycDocCubit>().reset();

                    await getIt<KycDocLocalRepository>().clear();
                    await EasyLoading.dismiss();
                    // Optionally show a success message
                    EasyLoading.showSuccess('Données supprimées');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
