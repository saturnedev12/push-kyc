// FILE: app/features/auth/presentation/cubit/auth_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/features/authentification/data/models/remote/auth_response_dto.dart';
import 'package:push_kyc/app/features/authentification/presentation/logic/auth_state.dart';
import 'package:push_kyc/app/features/local_storage/data/repositories/kyc_doc_local_repository.dart';

import '../../domain/usecases/auth_usecases.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecases usecases;
  final KycDocLocalRepository localStorageService;
  AuthCubit(this.usecases, this.localStorageService) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final AuthResponseDto resp = await usecases.login(
        email: email,
        password: password,
      );

      // Replace 'success', 'accessToken', and 'message' with actual fields from AuthResponseDto
      if (resp.success == true &&
          (resp.accessToken != null &&
              resp.email != null &&
              resp.refreshToken != null)) {
        await localStorageService.saveCredentials(
          email: resp.email!,
          accessToken: resp.accessToken!,
          refreshToken: resp.refreshToken!,
        );
        emit(AuthSuccess(resp.accessToken!));
        // NavigationService.navigatorKey.currentContext?.goNamed(LoadingScreen.name);
      } else {
        emit(AuthFailure(resp.message ?? 'Authentication failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void logout() {
    emit(AuthInitial()); // reset
  }
}
