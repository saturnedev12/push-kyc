// lib/App/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/constants/constants.dart';
import 'package:push_kyc/app/core/enums/enums.dart';
import 'package:push_kyc/app/core/extension/context_extension.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/home/presentation/components/round_badge.dart';
import 'package:push_kyc/app/features/home/presentation/components/status_pill.dart';
import 'package:push_kyc/app/features/home/presentation/utils/home_page_utils.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/pages/personnal_information_page.dart';

/// DataRow compacte pour "Informations personnelles"
class PersonalInfoDataRow extends StatelessWidget {
  const PersonalInfoDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      buildWhen:
          (p, c) =>
              p.firstName != c.firstName ||
              p.lastName != c.lastName ||
              p.nationalityCountryCode != c.nationalityCountryCode ||
              p.sexe != c.sexe ||
              p.phoneNumber != c.phoneNumber,
      builder: (context, state) {
        final entry = _entryStatus(state);

        // Pour l’instant : vérif = En attente, sync = Non synchronisé.
        const verif = 'En attente';
        return InkWell(
          onTap: () {
            editMode = true;
            context.pushNamed(PersonnalInformationPage.name);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SECTION (leading + libellé)
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            const RoundBadge(
                              icon: CupertinoIcons.person_crop_circle,
                              color: AppTheme.kPrimary,
                            ),
                            const Gap(5),
                            AutoSizeText(
                              'Informations personnelles',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ÉTAT
                Expanded(
                  flex: 2,
                  child: Center(
                    // alignment: Alignment.centerLeft,
                    child: StatusPill(
                      label: entryLabel(entry),
                      color: entryColor(context, entry),
                    ),
                  ),
                ),

                // VÉRIF.
                Expanded(
                  flex: 2,
                  child: Center(
                    // alignment: Alignment.centerLeft,
                    child: StatusPill(
                      label: verif,
                      color: CupertinoColors.systemGrey.resolveFrom(context),
                    ),
                  ),
                ),

                // SYNC
                // Expanded(
                //   flex: 3,
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: _StatusPill(
                //       label: sync,
                //       color: CupertinoColors.systemGrey2.resolveFrom(context),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  // État de saisie calculé
  static EntryStatus _entryStatus(KycDocState s) {
    int count = 0;
    bool filled(String? v) => v != null && v.trim().isNotEmpty;

    if (filled(s.firstName)) count++;
    if (filled(s.lastName)) count++;
    if (filled(s.nationalityCountryCode)) count++;
    if (s.sexe != null) count++;
    if (filled(s.phoneNumber)) count++;

    if (count == 0) return EntryStatus.none;
    if (count == 5) return EntryStatus.full;
    return EntryStatus.partial;
  }
}
