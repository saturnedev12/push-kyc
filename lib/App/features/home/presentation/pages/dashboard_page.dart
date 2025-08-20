// lib/App/features/dashboard/presentation/pages/dashboard_page.dart
import 'package:flutter/cupertino.dart';
import 'package:push_kyc/app/features/home/presentation/components/dashboard_table_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bg = CupertinoColors.secondarySystemBackground.resolveFrom(context);

    return const CustomScrollView(
      slivers: [
        // marge
        SliverToBoxAdapter(child: SizedBox(height: 12)),

        // Carte principale "datatable"
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverToBoxAdapter(child: DashboardTableCard()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
