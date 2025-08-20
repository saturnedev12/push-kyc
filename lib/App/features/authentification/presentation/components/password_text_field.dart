import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.placeholder = 'Mot de passe',
    this.onChanged,
    required this.controller,
  });

  final String placeholder;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverToBoxAdapter(
        child: TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          textInputAction: TextInputAction.done,
          onChanged: widget.onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez entrer un mot de passe';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: widget.placeholder,
            prefixIcon: const Icon(FontAwesomeIcons.lock),
            prefixIconColor: AppTheme.kPrimary,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            filled: true,
            fillColor: CupertinoColors.systemBackground.resolveFrom(context),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: CupertinoColors.systemGrey4.resolveFrom(context),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: AppTheme.kPrimary,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                color: CupertinoColors.systemGrey,
                size: 18,
              ),
              onPressed: _toggleObscure,
            ),
          ),
        ),
      ),
    );
  }
}
