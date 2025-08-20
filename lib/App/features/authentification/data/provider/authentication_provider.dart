// FILE: app/features/auth/data/providers/authentication_provider.dart
import 'package:dio/dio.dart';
import 'package:push_kyc/app/features/authentification/data/models/remote/auth_response_dto.dart';
import 'package:push_kyc/app/features/authentification/data/models/remote/login_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_provider.g.dart';

@RestApi(baseUrl: null)
abstract class AuthenticationProvider {
  factory AuthenticationProvider(Dio dio, {String baseUrl}) =
      _AuthenticationProvider;

  /// Auth: email + password only
  @POST('https://api.npoint.io/ddad54e0ae0aaf7be3ec')
  Future<AuthResponseDto> login(@Body() LoginDto body);
}
