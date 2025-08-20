// lib/App/features/dashboard/presentation/pages/dashboard_page.dart

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_kyc/App/features/home/presentation/components/table_header_row.dart';
import 'package:push_kyc/app/features/home/presentation/components/address_info_data_row.dart';
import 'package:push_kyc/app/features/home/presentation/components/birthdate_info_data_row.dart';
import 'package:push_kyc/app/features/home/presentation/components/dashboard_table_actions.dart';
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
        child: const Column(
          children: [
            DashboardTableActions(),
            TableHeaderRow(),
            Divider(height: 1),
            PersonalInfoDataRow(),
            Divider(height: 0.5, endIndent: 8, indent: 8),
            AddressInfoDataRow(),
            Divider(height: 0.5, endIndent: 8, indent: 8),
            BirthdateInfoDataRow(),
            Divider(height: 0.5, endIndent: 8, indent: 8),
            SelfieInfoDataRow(),
            Divider(height: 0.5, endIndent: 8, indent: 8),
            IdentityCardDataRow(),
          ],
        ),
      ),
    );
  }
}
