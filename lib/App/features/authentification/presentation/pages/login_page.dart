import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/authentification/presentation/components/email_login_text_field.dart';
import 'package:push_kyc/app/features/authentification/presentation/components/password_text_field.dart';
import 'package:push_kyc/app/features/authentification/presentation/logic/auth_cubit.dart';
import 'package:push_kyc/app/features/authentification/presentation/logic/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String name = "LoginPage";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Image.asset('assets/images/logo.png', width: 65),
              centerTitle: true,
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Connexion',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(16),
                    Text(
                      'Veuillez entrer vos identifiants pour vous connecter.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SliverGap(32),
            EmailLoginTextField(controller: _emailController),
            const SliverGap(16),
            PasswordTextField(controller: _passwordController),
            const SliverGap(32),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              sliver: SliverToBoxAdapter(
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return ElevatedButton(
                      onPressed:
                          isLoading
                              ? null
                              : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                }
                              },
                      child:
                          isLoading
                              ? const CupertinoActivityIndicator()
                              : const Text('Se connecter'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Center(
          child: Text(
            '© 2025 Wognin Saturnin Ayoua. Tous droits réservés',
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.kPrimaryDark,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
