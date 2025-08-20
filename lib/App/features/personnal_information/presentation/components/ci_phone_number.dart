import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

/// Sliver-friendly widget : à insérer dans un CustomScrollView
class CiPhoneTextField extends StatefulWidget {
  const CiPhoneTextField({
    super.key,
    this.placeholder = 'Numéro de téléphone (+225)',
  });

  final String placeholder;

  @override
  State<CiPhoneTextField> createState() => _CiPhoneTextFieldState();
}

class _CiPhoneTextFieldState extends State<CiPhoneTextField> {
  final _controller = TextEditingController();
  String? _error;

  static const _displayPrefix = '+225 ';
  static const _normalizedPrefix = '+225';

  @override
  void initState() {
    super.initState();
    final init = context.read<KycDocCubit>().state.phoneNumber ?? '';
    final display = _toDisplay(init);
    _controller.text = display;
    _error = _validate(display);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Normalise vers E.164: "+225XXXXXXXXXX" (pas d’espace)
  String _toNormalized(String displayText) {
    final digits = displayText.replaceAll(RegExp(r'[^0-9]'), '');
    // si l'utilisateur a collé "+225..." on enlève 225 du début
    final local = digits.startsWith('225') ? digits.substring(3) : digits;
    final local10 = local.padRight(0).substring(0, local.length.clamp(0, 10));
    return '$_normalizedPrefix$local10';
  }

  // Construit le texte d’affichage : "+225 " + XXXXXXXXXX
  String _toDisplay(String normalized) {
    if (!normalized.startsWith(_normalizedPrefix)) {
      if (normalized.isEmpty) return _displayPrefix;
      // cas improbable : autre préfixe → on force préfixe CI
    }
    final digits = normalized.replaceAll(RegExp(r'[^0-9]'), '');
    final local = digits.startsWith('225') ? digits.substring(3) : digits;
    return '$_displayPrefix$local';
  }

  String? _validate(String displayText) {
    // valide uniquement si exactement 10 chiffres après +225
    final digits = displayText.replaceAll(RegExp(r'[^0-9]'), '');
    final local = digits.startsWith('225') ? digits.substring(3) : digits;
    if (local.isEmpty) return null; // pas d'erreur tant que vide
    if (local.length != 10)
      return 'Le numéro doit contenir 10 chiffres après +225';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final grey = CupertinoColors.systemGrey4.resolveFrom(context);
    final bg = CupertinoColors.systemBackground.resolveFrom(context);

    return BlocListener<KycDocCubit, KycDocState>(
      listenWhen: (p, c) => p.phoneNumber != c.phoneNumber,
      listener: (_, s) {
        final display = _toDisplay(s.phoneNumber ?? '');
        if (_controller.text != display) {
          _controller.text = display;
          _controller.selection = TextSelection.collapsed(
            offset: _controller.text.length,
          );
          setState(() => _error = _validate(display));
        }
      },
      child: SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        sliver: SliverToBoxAdapter(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: [
              CiPhoneFormatter(), // ← masque/préfixe +225 & digits
            ],
            onChanged: (v) {
              // enregistre en E.164 dans le cubit
              final normalized = _toNormalized(v);
              context.read<KycDocCubit>().setPhone(normalized);
              setState(() => _error = _validate(v));
            },
            decoration: InputDecoration(
              hintText: widget.placeholder,
              prefixIcon: const Icon(CupertinoIcons.phone),
              prefixIconColor: AppTheme.kPrimary,
              suffixIcon:
                  (_error == null &&
                          _controller.text
                                  .replaceAll(RegExp(r'[^0-9]'), '')
                                  .length ==
                              13 // 225 + 10
                              )
                      ? const Icon(
                        CupertinoIcons.check_mark_circled_solid,
                        color: CupertinoColors.activeGreen,
                      )
                      : null,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),

              // Fond iOS
              filled: true,
              fillColor: bg,

              // Bordures arrondies (normal & focus)
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: grey, width: 1.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: AppTheme.kPrimary, width: 1.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),

              // Erreur (non focus & focus) → rouge
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
              ),

              // Message d’erreur
              errorText: _error,
            ),
          ),
        ),
      ),
    );
  }
}

/// InputFormatter qui garantit:
/// - préfixe toujours présent : "+225 "
/// - entrée limitée aux chiffres après le préfixe
/// - longueur max 10 chiffres
class CiPhoneFormatter extends TextInputFormatter {
  static const String _prefix = '+225 ';
  static final RegExp _digits = RegExp(r'\d');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Récupère tous les chiffres (y compris si l’utilisateur colle un +225...)
    final rawDigits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Enlève un éventuel 225 du début pour traiter le local
    String local =
        rawDigits.startsWith('225') ? rawDigits.substring(3) : rawDigits;

    // Garde uniquement les digits et limite à 10
    local = local.split('').where((c) => _digits.hasMatch(c)).join();
    if (local.length > 10) local = local.substring(0, 10);

    final display = '$_prefix$local';

    // Curseur en fin de texte (comportement naturel pour un masque simple)
    return TextEditingValue(
      text: display,
      selection: TextSelection.collapsed(offset: display.length),
      composing: TextRange.empty,
    );
  }
}
