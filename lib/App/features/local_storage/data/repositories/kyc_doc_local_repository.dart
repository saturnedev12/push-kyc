import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/core/enums/enums.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/enums.dart';
import 'package:push_kyc/app/core/config/isar_config.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
import 'package:push_kyc/app/features/local_storage/data/schemas/kyc_doc_local.dart';

@singleton
class KycDocLocalRepository {
  final IsarConfig isarConfig;
  KycDocLocalRepository(this.isarConfig);
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  /// Sauvegarde (id=0) l'état KYC en base locale
  Future<void> save(KycDocState state) async {
    final local =
        KycDocLocal()
          ..id = 0
          ..alreadyStarted = state.alreadyStarted
          ..validationOk = state.validationOk
          ..typeChoisi =
              state
                  .typeChoisi
                  ?.name // enum -> String
          ..pathRecto = state.pathRecto
          ..pathVerso = state.pathVerso
          ..pathPassport = state.pathPassport
          ..pathSelfie = state.pathSelfie
          ..birthYear = state.birthYear
          ..birthMonth = state.birthMonth
          ..birthDay = state.birthDay
          ..addressName = state.addressName
          ..addressLon = state.addressLon
          ..addressLat = state.addressLat
          ..residenceCountryCode = state.residenceCountryCode
          ..postalCode = state.postalCode
          ..firstName = state.firstName
          ..lastName = state.lastName
          ..email = state.email
          ..phoneNumber = state.phoneNumber
          ..sexe =
              state
                  .sexe
                  ?.name // enum -> String
          ..nationalityCountryCode = state.nationalityCountryCode;

    await isarConfig.instance.writeTxn(() async {
      await isarConfig.instance.kycDocLocals.put(local);
    });
  }

  /// Charge (id=0) la sauvegarde locale et renvoie un KycDocState
  Future<KycDocState?> load() async {
    final local = await isarConfig.instance.kycDocLocals.get(0);
    if (local == null) return null;

    // Parsing enums name -> enum (sécurisé)
    TypeId? parseTypeId(String? name) {
      if (name == null) return null;
      try {
        return TypeId.values.byName(name);
      } catch (_) {
        return null;
      }
    }

    Sexe? parseSexe(String? name) {
      if (name == null) return null;
      try {
        return Sexe.values.byName(name);
      } catch (_) {
        return null;
      }
    }

    return KycDocState(
      alreadyStarted: local.alreadyStarted,
      validationOk: local.validationOk,
      typeChoisi: parseTypeId(local.typeChoisi),
      pathRecto: local.pathRecto,
      pathVerso: local.pathVerso,
      pathPassport: local.pathPassport,
      pathSelfie: local.pathSelfie,
      birthYear: local.birthYear,
      birthMonth: local.birthMonth,
      birthDay: local.birthDay,
      addressName: local.addressName,
      addressLon: local.addressLon,
      addressLat: local.addressLat,
      residenceCountryCode: local.residenceCountryCode,
      postalCode: local.postalCode,
      firstName: local.firstName,
      lastName: local.lastName,
      email: local.email,
      phoneNumber: local.phoneNumber,
      sexe: parseSexe(local.sexe),
      nationalityCountryCode: local.nationalityCountryCode,
    );
  }

  Future<void> clear() async {
    await isarConfig.instance.writeTxn(() async {
      await isarConfig.instance.kycDocLocals.delete(0);
    });
  }

  // 🔐 GESTION SECURE STORAGE

  /// Sauvegarde email et token
  Future<void> saveCredentials({
    required String email,
    required String accessToken,
    required String refreshToken,
  }) async {
    await secureStorage.write(key: "user_email", value: email);
    await secureStorage.write(key: "accessToken", value: accessToken);
    await secureStorage.write(key: "refreshToken", value: refreshToken);
  }

  /// Récupère email et token
  Future<Map<String, String?>> getCredentials() async {
    final email = await secureStorage.read(key: "user_email");
    final accessToken = await secureStorage.read(key: "accessToken");
    final refreshToken = await secureStorage.read(key: "refreshToken");
    return {
      "email": email,
      "accessToken": accessToken,
      "refreshToken": refreshToken,
    };
  }

  /// Vérifie si des identifiants existent
  Future<bool> hasCredentials() async {
    final creds = await getCredentials();
    return (creds["email"] != null && creds["token"] != null);
  }
}
