// FILE: app/features/auth/data/repositories/auth_repository.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/features/authentification/data/models/remote/auth_response_dto.dart';
import 'package:push_kyc/app/features/authentification/data/models/remote/login_dto.dart';
import 'package:push_kyc/app/features/authentification/data/provider/authentication_provider.dart';
import 'package:push_kyc/app/features/authentification/domain/reposirories/auth_repository_interface.dart';

@LazySingleton(as: AuthRepositoryInterface)
class AuthRepository implements AuthRepositoryInterface {
  final Dio dio;
  AuthRepository(this.dio);

  AuthenticationProvider get _provider => AuthenticationProvider(dio);

  @override
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  }) {
    return _provider.login(LoginDto(email: email, password: password));
  }
}
