// lib/App/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:flutter/cupertino.dart';
import 'package:push_kyc/App/core/extension/context_extension.dart';

class TableHeaderRow extends StatelessWidget {
  const TableHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    final grey = CupertinoColors.systemGrey.resolveFrom(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              'SECTION',
              style: context.textTheme.bodySmall?.copyWith(
                color: grey,
                letterSpacing: .4,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'ÉTAT',
                style: context.textTheme.bodySmall?.copyWith(
                  color: grey,
                  letterSpacing: .4,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'VÉRIFICATION',
                style: context.textTheme.bodySmall?.copyWith(
                  color: grey,
                  letterSpacing: .4,
                ),
              ),
            ),
          ),

          // espace pour le chevron
        ],
      ),
    );
  }
}
