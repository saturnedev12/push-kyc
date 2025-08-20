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
import 'package:push_kyc/app/core/config/env_config.dart' as _i318;
import 'package:push_kyc/app/core/config/isar_config.dart' as _i13;
import 'package:push_kyc/app/core/network/dio_config.dart' as _i176;
import 'package:push_kyc/app/core/network/interceptors/auth_interceptor.dart'
    as _i1062;
import 'package:push_kyc/app/core/network/interceptors/error_interceptor.dart'
    as _i133;
import 'package:push_kyc/app/core/network/interceptors/request_interceptor.dart'
    as _i532;
import 'package:push_kyc/app/core/network/utils/easy_loading_handler.dart'
    as _i1008;
import 'package:push_kyc/app/core/network/utils/env_handler.dart' as _i585;
import 'package:push_kyc/app/core/utils/session_manager.dart' as _i288;
import 'package:push_kyc/app/features/authentification/data/repositories/auth_repository.dart'
    as _i852;
import 'package:push_kyc/app/features/authentification/domain/reposirories/auth_repository_interface.dart'
    as _i420;
import 'package:push_kyc/app/features/authentification/domain/usecases/auth_usecases.dart'
    as _i513;
import 'package:push_kyc/app/features/authentification/presentation/logic/auth_cubit.dart'
    as _i449;
import 'package:push_kyc/app/features/kyc_doc/data/repositories/kyc_repository.dart'
    as _i616;
import 'package:push_kyc/app/features/kyc_doc/domain/repositories/%20kyc_repository_interface.dart'
    as _i567;
import 'package:push_kyc/app/features/kyc_doc/domain/usecases/kyc_usecases.dart'
    as _i847;
import 'package:push_kyc/app/features/local_storage/data/repositories/kyc_doc_local_repository.dart'
    as _i961;
import 'package:push_kyc/app/features/photon_adress/data/repository/photon_repository.dart'
    as _i597;
import 'package:push_kyc/app/features/photon_adress/domain/usecases/photon_address_usecases.dart'
    as _i314;
import 'package:push_kyc/app/features/photon_adress/presentation/logic/photon_adress_cubit.dart'
    as _i378;

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
    gh.singleton<_i13.IsarConfig>(() => _i13.IsarConfig());
    gh.lazySingleton<_i318.EnvConfig>(() => _i318.EnvConfig());
    gh.lazySingleton<_i532.RequestInterceptor>(
        () => _i532.RequestInterceptor());
    gh.lazySingleton<_i1008.EasyLoadingHandler>(
        () => _i1008.EasyLoadingHandler());
    gh.lazySingleton<_i585.EnvHandler>(() => _i585.EnvHandler());
    gh.singleton<_i288.SessionManager>(
        () => _i288.SessionManager(gh<_i13.IsarConfig>()));
    gh.singleton<_i961.KycDocLocalRepository>(
        () => _i961.KycDocLocalRepository(gh<_i13.IsarConfig>()));
    gh.lazySingleton<_i133.ErrorInterceptor>(
        () => _i133.ErrorInterceptor(gh<_i288.SessionManager>()));
    gh.factory<_i1062.AuthInterceptor>(
        () => _i1062.AuthInterceptor(gh<_i288.SessionManager>()));
    gh.factory<_i847.KycUsecases>(
        () => _i847.KycUsecases(gh<_i567.KycRepositoryInterface>()));
    gh.lazySingleton<_i361.Dio>(() => dioConfig.dio(
          gh<_i1062.AuthInterceptor>(),
          gh<_i133.ErrorInterceptor>(),
          gh<_i532.RequestInterceptor>(),
        ));
    gh.lazySingleton<_i616.KycRepository>(
        () => _i616.KycRepository(gh<_i361.Dio>()));
    gh.lazySingleton<_i597.PhotonRepository>(
        () => _i597.PhotonRepository(gh<_i361.Dio>()));
    gh.lazySingleton<_i420.AuthRepositoryInterface>(
        () => _i852.AuthRepository(gh<_i361.Dio>()));
    gh.factory<_i314.PhotonAddressUsecases>(
        () => _i314.PhotonAddressUsecases(gh<_i597.PhotonRepository>()));
    gh.factory<_i513.AuthUsecases>(
        () => _i513.AuthUsecases(gh<_i420.AuthRepositoryInterface>()));
    gh.factory<_i378.PhotonAdressCubit>(
        () => _i378.PhotonAdressCubit(gh<_i314.PhotonAddressUsecases>()));
    gh.factory<_i449.AuthCubit>(() => _i449.AuthCubit(
          gh<_i513.AuthUsecases>(),
          gh<_i961.KycDocLocalRepository>(),
        ));
    return this;
  }
}

class _$DioConfig extends _i176.DioConfig {}
