import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/take_passeport_page.dart';
import 'package:push_kyc/app/features/documents/presentation/pages/takle_id_card_page.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/enums.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';

enum DocType { idCard, passport, driverLicense, residencePermit }

class TypeDocumentsPage extends StatelessWidget {
  const TypeDocumentsPage({super.key});
  static String name = 'TYPE_DOC';

  TypeId _mapDocType(DocType d) {
    switch (d) {
      case DocType.passport:
        return TypeId.PASSEPORT;
      case DocType.driverLicense:
        return TypeId.DRIVER_LICENSE;
      case DocType.residencePermit:
        return TypeId.RESIDENCE_PERMIT;
      case DocType.idCard:
        return TypeId.ID_CARD;
    }
  }

  DocType _mapTypeId(TypeId? t) {
    switch (t) {
      case TypeId.PASSEPORT:
        return DocType.passport;
      case TypeId.DRIVER_LICENSE:
        return DocType.driverLicense;
      case TypeId.RESIDENCE_PERMIT:
        return DocType.residencePermit;
      case TypeId.ID_CARD:
      default:
        return DocType.idCard;
    }
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF2F2F7);

    // ⚠️ Idéalement, fournis KycDocCubit plus haut (root de l’app).
    // Si tu insistes pour le fournir ici, dé-commente le BlocProvider ci-dessous.
    return _Scaffold(bg: bg, mapDocType: _mapDocType, mapTypeId: _mapTypeId);
  }
}

class _Scaffold extends StatelessWidget {
  final Color bg;
  final TypeId Function(DocType) mapDocType;
  final DocType Function(TypeId?) mapTypeId;

  const _Scaffold({
    required this.bg,
    required this.mapDocType,
    required this.mapTypeId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(toolbarHeight: 30),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choisissez votre document de vérification',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Vous devez présenter une pièce d’identité officielle',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // On ne rebuild que sur le champ typeChoisi
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: BlocSelector<KycDocCubit, KycDocState, TypeId?>(
                  selector: (s) => s.typeChoisi,
                  builder: (context, typeChoisi) {
                    final selectedDoc = mapTypeId(typeChoisi);
                    return Column(
                      children: [
                        _option(
                          label: 'Carte d’identité nationale',
                          icon: FontAwesomeIcons.idCard,
                          value: DocType.idCard,
                          bg: bg,
                          selectedDoc: selectedDoc,
                          onSelect:
                              (doc) => context.read<KycDocCubit>().choisirType(
                                mapDocType(doc),
                              ),
                        ),
                        const SizedBox(height: 12),
                        _option(
                          label: 'Passeport',
                          icon: FontAwesomeIcons.passport,
                          value: DocType.passport,
                          bg: bg,
                          selectedDoc: selectedDoc,
                          onSelect:
                              (doc) => context.read<KycDocCubit>().choisirType(
                                mapDocType(doc),
                              ),
                        ),
                        const SizedBox(height: 12),
                        _option(
                          label: 'Permis de conduire',
                          icon: FontAwesomeIcons.car,
                          value: DocType.driverLicense,
                          bg: bg,
                          selectedDoc: selectedDoc,
                          onSelect:
                              (doc) => context.read<KycDocCubit>().choisirType(
                                mapDocType(doc),
                              ),
                        ),
                        const SizedBox(height: 12),
                        _option(
                          label: 'Titre de séjour',
                          icon: FontAwesomeIcons.idBadge,
                          value: DocType.residencePermit,
                          bg: bg,
                          selectedDoc: selectedDoc,
                          onSelect:
                              (doc) => context.read<KycDocCubit>().choisirType(
                                mapDocType(doc),
                              ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(bottom: 15),
        height: 80,
        child: BlocSelector<KycDocCubit, KycDocState, bool>(
          selector: (s) => s.typeChoisi != null,
          builder: (context, hasType) {
            return ElevatedButton(
              onPressed:
                  hasType
                      ? () {
                        log('Continuer');
                        if (context.read<KycDocCubit>().state.typeChoisi ==
                            TypeId.PASSEPORT) {
                          context.pushNamed(TakePasseportPage.name);
                        } else {
                          context.pushNamed(TakleIdCardPage.name);
                        }
                      }
                      : null,
              child: const Text('Continuer'),
            );
          },
        ),
      ),
    );
  }

  Widget _option({
    required String label,
    required IconData icon,
    required DocType value,
    required Color bg,
    required DocType selectedDoc,
    required ValueChanged<DocType> onSelect,
  }) {
    final isSelected = selectedDoc == value;
    return GestureDetector(
      onTap: () => onSelect(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.kPrimary : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: FaIcon(icon, size: 18, color: Colors.black87),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Radio<DocType>(
              value: value,
              groupValue: selectedDoc,
              onChanged: (_) => onSelect(value),
              fillColor: const WidgetStatePropertyAll(AppTheme.kPrimary),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
      ),
    );
  }
}
