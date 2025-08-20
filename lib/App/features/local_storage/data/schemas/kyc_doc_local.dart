import 'package:isar/isar.dart';

part 'kyc_doc_local.g.dart';

@collection
class KycDocLocal {
  Id id = 1;

  bool alreadyStarted = false;
  bool validationOk = false;

  String? typeChoisi;

  String? pathRecto;
  String? pathVerso;
  String? pathPassport;
  String? pathSelfie;

  int? birthYear;
  int? birthMonth;
  int? birthDay;

  String? addressName;
  double? addressLon;
  double? addressLat;
  String? residenceCountryCode;
  String? postalCode;

  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  String? sexe;
  String? nationalityCountryCode;
}
