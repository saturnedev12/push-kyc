import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

class GetStartedCard extends StatelessWidget {
  final VoidCallback? onTap;
  const GetStartedCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      button: true,
      label: "Démarrer l’enregistrement KYC",
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: DottedBorder(
          // Garde l’API de ton package de dotted border
          options: RoundedRectDottedBorderOptions(
            color: AppTheme.kPrimary.withOpacity(0.30),
            strokeWidth: 1.5,
            dashPattern: const [6, 4],
            radius: const Radius.circular(16),
          ),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              color: AppTheme.kSurfaceLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icône circulaire
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.kPrimary.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.idCard,
                    size: 32,
                    color: AppTheme.kPrimary,
                  ),
                ),

                const Gap(20),

                // Titre orienté
                Text(
                  'Commencez votre KYC',
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.kPrimaryDarker,
                  ),
                ),

                const Gap(8),

                // Texte d’aide court et utile
                Text(
                  "Aucun KYC n’est entamé pour l’instant.\n"
                  "Préparez votre pièce d’identité et suivez les étapes guidées.",
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                    height: 1.35,
                  ),
                ),

                const Gap(25),

                // CTA principal
                InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.kPrimary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.kPrimary.withOpacity(0.20),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Démarrer l’enregistrement',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 8),
                        FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: 14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

                const Gap(15),

                // Petit reassurance line
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.lock,
                      size: 12,
                      color: Colors.black45,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Sécurisé • 3–5 min',
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
