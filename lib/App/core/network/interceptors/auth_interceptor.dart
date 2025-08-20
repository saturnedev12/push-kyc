import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/core/utils/session_manager.dart';
import 'package:push_kyc/app/features/authentification/data/models/local/user_local.dart';

@injectable
class AuthInterceptor extends Interceptor {
  SessionManager sessionManager;
  AuthInterceptor(this.sessionManager);
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    UserLocal? data = await sessionManager.getCurrentUser();

    if (data != null) {
      final token = data.token;
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
