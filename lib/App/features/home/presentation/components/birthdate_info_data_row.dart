// lib/App/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/enums/enums.dart';
import 'package:push_kyc/app/core/extension/context_extension.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/birthdate_page/presentation/birthdate_page.dart';
import 'package:push_kyc/app/features/home/presentation/components/round_badge.dart';
import 'package:push_kyc/app/features/home/presentation/components/status_pill.dart';
import 'package:push_kyc/app/features/home/presentation/utils/home_page_utils.dart';

/// DataRow compacte pour "Informations personnelles"
class BirthdateInfoDataRow extends StatelessWidget {
  const BirthdateInfoDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      buildWhen:
          (p, c) =>
              p.birthYear != c.birthYear ||
              p.birthMonth != c.birthMonth ||
              p.birthDay != c.birthDay,
      builder: (context, state) {
        final entry = _entryStatus(state);

        // Pour l’instant : vérif = En attente, sync = Non synchronisé.
        const verif = 'En attente';

        return InkWell(
          onTap: () {
            context.pushNamed(BirthdatePage.name);
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
                              icon: Icons.cake,
                              color: AppTheme.kPrimary,
                            ),
                            const Gap(5),
                            Text(
                              'Date de naissance',
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

  // Calcul de l’état de saisie (none / partial / full) pour la date de naissance
  static EntryStatus _entryStatus(KycDocState s) {
    final hasY = s.birthYear != null;
    final hasM = s.birthMonth != null;
    final hasD = s.birthDay != null;

    if (!hasY && !hasM && !hasD) return EntryStatus.none;
    // birthDate est non-null seulement si Y+M+D sont tous présents
    if (s.birthDate != null) return EntryStatus.full;
    return EntryStatus.partial;
  }
}
