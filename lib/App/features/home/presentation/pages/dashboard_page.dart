// lib/App/features/dashboard/presentation/pages/dashboard_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:push_kyc/app/core/extension/context_extension.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/home/presentation/components/dashboard_table_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bg = CupertinoColors.secondarySystemBackground.resolveFrom(context);

    return CustomScrollView(
      slivers: [
        // marge
        const SliverGap(50),

        // Carte principale "datatable"
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(child: DashboardTableCard()),
        ),

        const SliverGap(30),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onTap: () {},
              title: Text(
                'Envoyer le KYC pour vérification',

                style: context.textTheme.titleMedium!.copyWith(
                  color: AppTheme.kPrimary,
                ),
              ),
              leading: const FaIcon(
                FontAwesomeIcons.cloudArrowUp,
                color: AppTheme.kPrimary,
              ),
              tileColor: CupertinoColors.white,

              trailing: const FaIcon(
                FontAwesomeIcons.circleChevronRight,
                color: AppTheme.kPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
