// lib/App/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/enums/enums.dart';
import 'package:push_kyc/app/core/extension/context_extension.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/type_documents_page.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/enums.dart';
import 'package:push_kyc/app/features/home/presentation/components/round_badge.dart';
import 'package:push_kyc/app/features/home/presentation/components/status_pill.dart';
import 'package:push_kyc/app/features/home/presentation/utils/home_page_utils.dart';

/// DataRow compacte pour "Informations personnelles"
class IdentityCardDataRow extends StatelessWidget {
  const IdentityCardDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      buildWhen:
          (p, c) =>
              p.typeChoisi != c.typeChoisi ||
              p.pathRecto != c.pathRecto ||
              p.pathVerso != c.pathVerso ||
              p.pathPassport != c.pathPassport,
      builder: (context, state) {
        final entry = _entryStatus(state);

        // Pour l’instant : vérif = En attente, sync = Non synchronisé.
        const verif = 'En attente';

        return InkWell(
          onTap: () {
            context.pushNamed(TypeDocumentsPage.name);
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
                              icon: FontAwesomeIcons.idCard,
                              color: AppTheme.kPrimary,
                            ),
                            const Gap(5),
                            AutoSizeText(
                              "Pièce d'identité",
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

  // 👇 Calcul de l’état de saisie pour l’identité
  // Règle :
  // - PASSEPORT  -> besoin de pathPassport
  // - autres     -> besoin de pathRecto + pathVerso
  static EntryStatus _entryStatus(KycDocState s) {
    bool isNotEmpty(String? v) => v != null && v.trim().isNotEmpty;

    final hasType = s.typeChoisi != null;
    final hasRecto = isNotEmpty(s.pathRecto);
    final hasVerso = isNotEmpty(s.pathVerso);
    final hasPassport = isNotEmpty(s.pathPassport);

    // Aucun choix + aucun fichier -> rien saisi
    if (!hasType && !hasRecto && !hasVerso && !hasPassport) {
      return EntryStatus.none;
    }

    // Si le type n'est pas encore choisi mais des fichiers existent -> en cours
    if (!hasType) return EntryStatus.partial;

    // Selon le type choisi
    if (s.typeChoisi == TypeId.PASSEPORT) {
      return hasPassport ? EntryStatus.full : EntryStatus.partial;
    } else {
      // ID_CARD / DRIVER_LICENSE / RESIDENCE_PERMIT
      return (hasRecto && hasVerso) ? EntryStatus.full : EntryStatus.partial;
    }
  }
}
