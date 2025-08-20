import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/core/config/env_config.dart';
import 'package:push_kyc/app/core/config/isar_config.dart';
import 'package:push_kyc/app/core/network/utils/easy_loading_handler.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  await getIt<IsarConfig>().init();
  await getIt<EasyLoadingHandler>().init();
  await getIt<EnvConfig>().init();
}
