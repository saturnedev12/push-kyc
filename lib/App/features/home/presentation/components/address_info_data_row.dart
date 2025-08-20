// lib/App/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:push_kyc/app/features/adress_location/presentation/pages/adress_location_page.dart';
import 'package:push_kyc/app/features/home/presentation/components/round_badge.dart';
import 'package:push_kyc/app/features/home/presentation/components/status_pill.dart';
import 'package:push_kyc/app/features/home/presentation/utils/home_page_utils.dart';

/// DataRow compacte pour "Informations personnelles"
class AddressInfoDataRow extends StatelessWidget {
  const AddressInfoDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycDocCubit, KycDocState>(
      buildWhen:
          (p, c) =>
              p.addressName != c.addressName ||
              p.addressLat != c.addressLat ||
              p.addressLon != c.addressLon ||
              p.residenceCountryCode != c.residenceCountryCode ||
              p.postalCode != c.postalCode,
      builder: (context, state) {
        final entry = _entryStatus(state);

        // Pour l’instant : vérif = En attente, sync = Non synchronisé.
        const verif = 'En attente';

        return InkWell(
          onTap: () {
            // TODO: Naviguer vers la page d’édition d’infos perso
            context.pushNamed(AdressLocationPage.name);
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
                              icon: Icons.location_on,
                              color: AppTheme.kPrimary,
                            ),
                            const Gap(5),
                            AutoSizeText(
                              'Addresses',
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
    bool presentDouble(double? v) => v != null && v.isFinite;

    if (filled(s.addressName)) count++;
    if (presentDouble(s.addressLat)) count++;
    if (presentDouble(s.addressLon)) count++;
    if (filled(s.residenceCountryCode)) count++;
    if (filled(s.postalCode)) count++;

    if (count == 0) return EntryStatus.none;
    if (count == 5) return EntryStatus.full;
    return EntryStatus.partial;
  }
}
