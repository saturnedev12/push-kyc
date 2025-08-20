import 'package:equatable/equatable.dart';
import 'package:push_kyc/app/core/enums/enums.dart';
import 'package:push_kyc/app/features/documents/presentation/utils/enums.dart';

class KycDocState extends Equatable {
  final bool? alreadyStarted;

  //ID
  final TypeId? typeChoisi;
  final String? pathRecto;
  final String? pathVerso;
  final String? pathPassport;
  final bool validationOk;
  final String? pathSelfie;

  // Naissance
  final int? birthYear;
  final int? birthMonth;
  final int? birthDay;

  // Adresse & pays
  final String? addressName; // ex: "Le Plateau, Abidjan"
  final double? addressLon; // longitude
  final double? addressLat; // latitude
  final String? residenceCountryCode; // ex: "CI"
  final String? postalCode;

  // Identité
  final String? firstName; // prénom
  final String? lastName; // nom
  final String? email; // email
  final String? phoneNumber; // numéro de téléphone
  final Sexe? sexe; // Homme/Femme
  final String? nationalityCountryCode; // ex: "CI"

  DateTime? get birthDate {
    if (birthYear == null || birthMonth == null || birthDay == null)
      return null;
    return DateTime(birthYear!, birthMonth!, birthDay!);
  }

  const KycDocState({
    this.typeChoisi,
    this.pathRecto,
    this.pathVerso,
    this.pathPassport,
    this.pathSelfie,
    this.validationOk = false,
    this.birthYear,
    this.birthMonth,
    this.birthDay,
    this.addressName,
    this.addressLon,
    this.addressLat,
    this.residenceCountryCode,
    this.nationalityCountryCode,
    this.postalCode,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.sexe,
    this.alreadyStarted,
  });

  KycDocState copyWith({
    TypeId? typeChoisi,
    String? pathRecto,
    String? pathVerso,
    String? pathPassport,
    bool? validationOk,
    String? pathSelfie,
    int? birthYear,
    int? birthMonth,
    int? birthDay,
    String? addressName,
    double? addressLon,
    double? addressLat,
    String? residenceCountryCode,
    String? nationalityCountryCode,
    String? postalCode,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    Sexe? sexe,
    bool? alreadyStarted,
  }) {
    return KycDocState(
      typeChoisi: typeChoisi ?? this.typeChoisi,
      pathRecto: pathRecto ?? this.pathRecto,
      pathVerso: pathVerso ?? this.pathVerso,
      pathPassport: pathPassport ?? this.pathPassport,
      validationOk: validationOk ?? this.validationOk,
      pathSelfie: pathSelfie ?? this.pathSelfie,
      birthYear: birthYear ?? this.birthYear,
      birthMonth: birthMonth ?? this.birthMonth,
      birthDay: birthDay ?? this.birthDay,
      addressName: addressName ?? this.addressName,
      addressLon: addressLon ?? this.addressLon,
      addressLat: addressLat ?? this.addressLat,
      residenceCountryCode: residenceCountryCode ?? this.residenceCountryCode,
      nationalityCountryCode:
          nationalityCountryCode ?? this.nationalityCountryCode,
      postalCode: postalCode ?? this.postalCode,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      sexe: sexe ?? this.sexe,
      alreadyStarted: alreadyStarted ?? this.alreadyStarted,
    );
  }

  @override
  List<Object?> get props => [
    typeChoisi,
    pathRecto,
    pathVerso,
    pathPassport,
    validationOk,
    pathSelfie,
    birthYear,
    birthMonth,
    birthDay,
    addressName,
    addressLon,
    addressLat,
    residenceCountryCode,
    nationalityCountryCode,
    postalCode,
    firstName,
    lastName,
    email,
    phoneNumber,
    sexe,
    alreadyStarted,
  ];
}
