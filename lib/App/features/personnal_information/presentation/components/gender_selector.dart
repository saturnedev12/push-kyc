// lib/App/features/profile/presentation/widgets/gender_selector.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:push_kyc/app/core/enums/enums.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<KycDocCubit, KycDocState, Sexe?>(
      selector: (s) => s.sexe,
      builder: (context, selected) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: _GenderCard(
                    selected: selected == Sexe.homme,
                    top: 'Je suis un',
                    bottom: 'HOMME',
                    icon: const FaIcon(FontAwesomeIcons.person, size: 38),
                    onTap:
                        () => context.read<KycDocCubit>().setSexe(Sexe.homme),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _GenderCard(
                    selected: selected == Sexe.femme,
                    top: 'Je suis une',
                    bottom: 'FEMME',
                    icon: const FaIcon(FontAwesomeIcons.personDress, size: 38),
                    onTap:
                        () => context.read<KycDocCubit>().setSexe(Sexe.femme),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _GenderCard extends StatelessWidget {
  const _GenderCard({
    required this.selected,
    required this.top,
    required this.bottom,
    required this.icon,
    required this.onTap,
  });

  final bool selected;
  final String top;
  final String bottom;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = CupertinoColors.systemBackground.resolveFrom(context);
    final border = CupertinoColors.systemGrey4.resolveFrom(context);
    const active = AppTheme.kPrimary;
    final label = CupertinoColors.label.resolveFrom(context);
    final secondary = CupertinoColors.secondaryLabel.resolveFrom(context);

    return Semantics(
      button: true,
      selected: selected,
      label: '$top $bottom',
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: selected ? active.withOpacity(0.10) : bg,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected ? active : border,
              width: selected ? 1.6 : 1.0,
            ),
            boxShadow: [
              if (!selected)
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconTheme(
                data: IconThemeData(
                  color: selected ? active : secondary,
                  size: 38,
                ),
                child: icon,
              ),
              const SizedBox(height: 12),
              Text(
                top,
                style: TextStyle(color: secondary, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                bottom,
                style: TextStyle(
                  color: selected ? active : label,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
