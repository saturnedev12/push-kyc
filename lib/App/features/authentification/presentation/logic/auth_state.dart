// FILE: app/features/auth/presentation/cubit/auth_cubit.dart

import 'package:equatable/equatable.dart';

/// Base class for all authentication states
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// État initial
class AuthInitial extends AuthState {}

/// État en cours de chargement
class AuthLoading extends AuthState {}

/// État quand l’authentification réussit
class AuthSuccess extends AuthState {
  final String token; // ou ton UserDto si tu veux
  const AuthSuccess(this.token);

  @override
  List<Object?> get props => [token];
}

/// État quand l’authentification échoue
class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}
