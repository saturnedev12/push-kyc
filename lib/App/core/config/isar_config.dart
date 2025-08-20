import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import 'package:path_provider/path_provider.dart';
import 'package:push_kyc/app/features/authentification/data/models/local/user_local.dart';
import 'package:push_kyc/app/features/local_storage/data/schemas/kyc_doc_local.dart';

late final Isar _isar;

@singleton
class IsarConfig {
  /// Initialisation de la base de données Isar
  Future<void> init() async {
    _isar = await Isar.open(
      [KycDocLocalSchema, UserLocalSchema],
      name: 'push_kyc',
      directory: await getApplicationDocumentsDirectory().then(
        (dir) => dir.path,
      ),
    );
  }

  /// Fournit une instance de Isar
  Isar get instance => _isar;
}
