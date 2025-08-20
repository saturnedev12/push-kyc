import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

class PostalCodeField extends StatefulWidget {
  const PostalCodeField({super.key, this.placeholder = 'Addresse postal'});

  final String placeholder;

  @override
  State<PostalCodeField> createState() => _PostalCodeFieldState();
}

class _PostalCodeFieldState extends State<PostalCodeField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final init = context.read<KycDocCubit>().state.postalCode ?? '';
    _controller.text = init;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycDocCubit, KycDocState>(
      listenWhen: (p, c) => p.postalCode != c.postalCode,
      listener: (_, s) {
        final value = s.postalCode ?? '';
        if (_controller.text != value) _controller.text = value;
      },
      child: SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        sliver: SliverToBoxAdapter(
          child: TextField(
            controller: _controller,
            textInputAction: TextInputAction.done,
            onChanged: (v) => context.read<KycDocCubit>().setPostalCode(v),
            decoration: InputDecoration(
              hintText: widget.placeholder,
              prefixIcon: const Icon(FontAwesomeIcons.signsPost),
              prefixIconColor: AppTheme.kPrimary,
              isDense: true,

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),

              // Fond iOS
              filled: true,
              fillColor: CupertinoColors.systemBackground.resolveFrom(context),

              // Bordure grise arrondie (état normal)
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: CupertinoColors.systemGrey4.resolveFrom(context),
                  width: 1.0,
                ),
              ),

              // Bordure focus (légèrement plus marquée)
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppTheme.kPrimary,
                  width: 1.5,
                ),
              ),

              // Bordure par défaut (fallback)
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
