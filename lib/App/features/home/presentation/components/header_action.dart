// lib/App/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderAction extends StatelessWidget {
  const HeaderAction({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.iconColor,
    this.borderColor,
    this.labelColor,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? borderColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final border =
        borderColor ?? CupertinoColors.systemGrey4.resolveFrom(context);
    final bg = CupertinoColors.systemBackground.resolveFrom(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: border),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: iconColor ?? CupertinoColors.label.resolveFrom(context),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: labelColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
