import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/features/authentification/data/models/remote/auth_response_dto.dart';
import 'package:push_kyc/app/features/authentification/domain/reposirories/auth_repository_interface.dart';

@injectable
class AuthUsecases {
  final AuthRepositoryInterface repository;
  AuthUsecases(this.repository);

  Future<AuthResponseDto> login({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
