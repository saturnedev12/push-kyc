// FILE: app/features/auth/domain/repositories/auth_repository_interface.dart

import 'package:push_kyc/app/features/authentification/data/models/remote/auth_response_dto.dart';

abstract class AuthRepositoryInterface {
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  });
}
