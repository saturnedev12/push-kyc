import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import 'package:path_provider/path_provider.dart';

late final Isar _isar;

@singleton
class IsarConfig {
  /// Initialisation de la base de données Isar
  Future<void> init() async {
    _isar = await Isar.open(
      [
        //? local entities
      ],
      directory: await getApplicationDocumentsDirectory().then(
        (dir) => dir.path,
      ),
    );
  }

  /// Fournit une instance de Isar
  Isar get instance => _isar;
}
