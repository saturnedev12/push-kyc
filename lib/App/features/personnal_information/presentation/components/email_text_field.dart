import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/core/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({super.key, this.placeholder = 'Votre email'});

  final String placeholder;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void initState() {
    super.initState();
    final init = context.read<KycDocCubit>().state.email ?? '';
    _controller.text = init;
    _error = _validate(init); // initialise l'état d'erreur
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _validate(String value) {
    final v = value.trim();
    if (v.isEmpty) return null; // pas d'erreur tant que vide
    final emailRe = RegExp(
      r'^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$',
      caseSensitive: false,
    );
    if (!emailRe.hasMatch(v)) return 'Adresse email invalide';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final grey = CupertinoColors.systemGrey4.resolveFrom(context);
    final bg = CupertinoColors.systemBackground.resolveFrom(context);

    return BlocListener<KycDocCubit, KycDocState>(
      listenWhen: (p, c) => p.email != c.email,
      listener: (_, s) {
        final value = s.email ?? '';
        if (_controller.text != value) {
          _controller.text = value;
          _error = _validate(value);
          setState(() {});
        }
      },
      child: SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        sliver: SliverToBoxAdapter(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            enableSuggestions: false,
            autocorrect: false,
            onChanged: (v) {
              final trimmed = v.trim();
              context.read<KycDocCubit>().setEmail(trimmed);
              setState(() => _error = _validate(trimmed));
            },
            decoration: InputDecoration(
              hintText: widget.placeholder,
              prefixIcon: const Icon(CupertinoIcons.envelope),
              prefixIconColor: AppTheme.kPrimary,
              suffixIcon:
                  (_error == null && _controller.text.trim().isNotEmpty)
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

              // Bordures arrondies
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
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
              ),
              // Erreur
              errorText: _error,
            ),
          ),
        ),
      ),
    );
  }
}
