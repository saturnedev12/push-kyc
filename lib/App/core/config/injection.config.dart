// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:push_kyc/App/core/config/env_config.dart' as _i697;
import 'package:push_kyc/App/core/config/isar_config.dart' as _i288;
import 'package:push_kyc/App/core/network/dio_config.dart' as _i860;
import 'package:push_kyc/App/core/network/interceptors/auth_interceptor.dart'
    as _i123;
import 'package:push_kyc/App/core/network/interceptors/error_interceptor.dart'
    as _i921;
import 'package:push_kyc/App/core/network/interceptors/request_interceptor.dart'
    as _i559;
import 'package:push_kyc/App/core/network/utils/easy_loading_handler.dart'
    as _i231;
import 'package:push_kyc/App/core/network/utils/env_handler.dart' as _i987;
import 'package:push_kyc/App/core/utils/session_manager.dart' as _i315;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioConfig = _$DioConfig();
    gh.singleton<_i288.IsarConfig>(() => _i288.IsarConfig());
    gh.lazySingleton<_i697.EnvConfig>(() => _i697.EnvConfig());
    gh.lazySingleton<_i559.RequestInterceptor>(
        () => _i559.RequestInterceptor());
    gh.lazySingleton<_i231.EasyLoadingHandler>(
        () => _i231.EasyLoadingHandler());
    gh.lazySingleton<_i987.EnvHandler>(() => _i987.EnvHandler());
    gh.singleton<_i315.SessionManager>(
        () => _i315.SessionManager(gh<_i288.IsarConfig>()));
    gh.lazySingleton<_i921.ErrorInterceptor>(
        () => _i921.ErrorInterceptor(gh<_i315.SessionManager>()));
    gh.factory<_i123.AuthInterceptor>(
        () => _i123.AuthInterceptor(gh<_i315.SessionManager>()));
    gh.lazySingleton<_i361.Dio>(() => dioConfig.dio(
          gh<_i123.AuthInterceptor>(),
          gh<_i921.ErrorInterceptor>(),
          gh<_i559.RequestInterceptor>(),
        ));
    return this;
  }
}

class _$DioConfig extends _i860.DioConfig {}
