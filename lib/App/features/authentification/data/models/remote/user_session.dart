import 'package:injectable/injectable.dart';

@singleton
class UserSession {
  String? email;
  String? token;

  UserSession();

  void setSession({required String email, required String token}) {
    this.email = email;
    this.token = token;
  }

  void clearSession() {
    email = null;
    token = null;
  }

  bool get isAuthenticated => email != null && token != null;
}
