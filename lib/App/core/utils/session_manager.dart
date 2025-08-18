import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:push_kyc/App/core/config/isar_config.dart';
import 'package:push_kyc/App/features/authentification/data/models/local/user_local.dart';

@singleton
class SessionManager {
  //final isarConfig = getIt<IsarConfig>();
  IsarConfig isarConfig;
  SessionManager(this.isarConfig);

  UserLocal? currentUser;

  Future<void> saveUser(UserLocal user) async {
    await isarConfig.instance.writeTxn(() async {
      await isarConfig.instance.userLocals.put(user);
    });
    currentUser = user;
  }

  Future<UserLocal?> getCurrentUser() async {
    print('Get User');
    if (currentUser == null) {
      final user = await isarConfig.instance.userLocals.where().findFirst();
      if (user != null) {
        currentUser = user;
      }
    }
    return currentUser;
  }

  Future<void> clearSession() async {
    await isarConfig.instance.writeTxn(() async {
      await isarConfig.instance.userLocals.clear();
    });
    currentUser = null;
  }

  // Future setOpended() async {
  //   await isarConfig.instance.writeTxn(() async {
  //     await isarConfig.instance.onboardingSchemas
  //         .put(OnboardingSchema()..date = DateTime.now());
  //   });
  // }
}
