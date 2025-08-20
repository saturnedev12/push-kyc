import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_info_dto.freezed.dart';
part 'personal_info_dto.g.dart';

@freezed
class PersonalInfoDto with _$PersonalInfoDto {
  const factory PersonalInfoDto({
    // Identité
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,

    String? sexe,

    // Naissance
    int? birthYear,
    int? birthMonth,
    int? birthDay,

    // Adresse & pays
    String? addressName, // "Le Plateau, Abidjan"
    double? addressLon,
    double? addressLat,
    String? residenceCountryCode, // "CI"
    String? nationalityCountryCode, // "CI"
    String? postalCode,
  }) = _PersonalInfoDto;

  factory PersonalInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoDtoFromJson(json);
}
