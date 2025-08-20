// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalInfoDtoImpl _$$PersonalInfoDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalInfoDtoImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      sexe: json['sexe'] as String?,
      birthYear: (json['birthYear'] as num?)?.toInt(),
      birthMonth: (json['birthMonth'] as num?)?.toInt(),
      birthDay: (json['birthDay'] as num?)?.toInt(),
      addressName: json['addressName'] as String?,
      addressLon: (json['addressLon'] as num?)?.toDouble(),
      addressLat: (json['addressLat'] as num?)?.toDouble(),
      residenceCountryCode: json['residenceCountryCode'] as String?,
      nationalityCountryCode: json['nationalityCountryCode'] as String?,
      postalCode: json['postalCode'] as String?,
    );

Map<String, dynamic> _$$PersonalInfoDtoImplToJson(
        _$PersonalInfoDtoImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'sexe': instance.sexe,
      'birthYear': instance.birthYear,
      'birthMonth': instance.birthMonth,
      'birthDay': instance.birthDay,
      'addressName': instance.addressName,
      'addressLon': instance.addressLon,
      'addressLat': instance.addressLat,
      'residenceCountryCode': instance.residenceCountryCode,
      'nationalityCountryCode': instance.nationalityCountryCode,
      'postalCode': instance.postalCode,
    };
