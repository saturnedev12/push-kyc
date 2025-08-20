// lib/App/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/home/presentation/components/address_info_data_row.dart';
import 'package:push_kyc/app/features/home/presentation/components/birthdate_info_data_row.dart';
import 'package:push_kyc/app/features/home/presentation/components/header_action.dart';
import 'package:push_kyc/app/features/home/presentation/components/identity_card_data_row.dart';
import 'package:push_kyc/app/features/home/presentation/components/personal_info_data_row.dart';
import 'package:push_kyc/app/features/home/presentation/components/selfie_info_data_row.dart';

class DashboardTableCard extends StatelessWidget {
  const DashboardTableCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBg = CupertinoColors.systemBackground.resolveFrom(context);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(0.75), // 90% de la taille
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(18),
          // border: Border.all(color: border, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // En-tête de la carte (titre + actions)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.waveform_path_ecg,
                    color: AppTheme.kPrimary,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Sections',
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
                    icon: CupertinoIcons.arrow_up_arrow_down,
                    label: 'Trier',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Ligne d'entête de colonnes (datatable)
            const _TableHeaderRow(),

            const Divider(height: 1),

            // ======= LIGNES =======
            // Unique ligne pour l'instant : Informations personnelles
            const PersonalInfoDataRow(),
            const Divider(height: 0.5, endIndent: 8, indent: 8),

            const AddressInfoDataRow(),
            const Divider(height: 0.5, endIndent: 8, indent: 8),
            const BirthdateInfoDataRow(),
            const Divider(height: 0.5, endIndent: 8, indent: 8),
            const SelfieInfoDataRow(),
            const Divider(height: 0.5, endIndent: 8, indent: 8),
            const IdentityCardDataRow(),
            // (Plus tard : ajoute d'autres lignes ici)
          ],
        ),
      ),
    );
  }
}

class _TableHeaderRow extends StatelessWidget {
  const _TableHeaderRow();

  @override
  Widget build(BuildContext context) {
    final grey = CupertinoColors.systemGrey.resolveFrom(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 5,
            child: Text(
              'SECTION',
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                letterSpacing: .4,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'ÉTAT',
                style: TextStyle(color: grey, letterSpacing: .4),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'VÉRIF.',
                style: TextStyle(color: grey, letterSpacing: .4),
              ),
            ),
          ),

          // espace pour le chevron
        ],
      ),
    );
  }
}
