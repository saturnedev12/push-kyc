import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

class EmailLoginTextField extends StatefulWidget {
  const EmailLoginTextField({
    super.key,
    this.placeholder = 'Votre email',
    this.onChanged,
    this.initialValue,
    this.controller,
  });

  final String placeholder;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final TextEditingController? controller;

  @override
  State<EmailLoginTextField> createState() => _EmailLoginTextFieldState();
}

class _EmailLoginTextFieldState extends State<EmailLoginTextField> {
  late final TextEditingController _controller;
  String? _error;

  TextEditingController get controller => _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ??
        TextEditingController(text: widget.initialValue ?? '');
    _error = _validate(_controller.text);
    _controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onControllerChanged() {
    final trimmed = _controller.text.trim();
    setState(() => _error = _validate(trimmed));
    widget.onChanged?.call(trimmed);
  }

  String? _validate(String value) {
    final v = value.trim();
    if (v.isEmpty) return null;
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

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverToBoxAdapter(
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.none,
          enableSuggestions: false,
          autocorrect: false,
          validator: (value) => _validate(value ?? ''),
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
            filled: true,
            fillColor: bg,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: grey, width: 1.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: AppTheme.kPrimary, width: 1.5),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
            ),
            errorText: _error,
          ),
        ),
      ),
    );
  }
}

// Remplacez FormTextField par votre widget personnalisé ou celui de votre package.
