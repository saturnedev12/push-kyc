import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_fields_dto.freezed.dart';
part 'kyc_fields_dto.g.dart';

@freezed
class KycFieldsDto with _$KycFieldsDto {
  const factory KycFieldsDto({
    // Identité
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,

    // Naissance
    String? birthYear,
    String? birthMonth,
    String? birthDay,

    // Adresse
    String? addressName,
    String? addressLat,
    String? addressLon,
    String? residenceCountryCode,
    String? nationalityCountryCode,
    String? postalCode,

    // ID
    String? typeChoisi,
    String? pathRecto,
    String? pathVerso,
    String? pathPassport,
    String? pathSelfie,
  }) = _KycFieldsDto;

  factory KycFieldsDto.fromJson(Map<String, dynamic> json) =>
      _$KycFieldsDtoFromJson(json);
}
