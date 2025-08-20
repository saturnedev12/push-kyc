// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_fields_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycFieldsDtoImpl _$$KycFieldsDtoImplFromJson(Map<String, dynamic> json) =>
    _$KycFieldsDtoImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      birthYear: json['birthYear'] as String?,
      birthMonth: json['birthMonth'] as String?,
      birthDay: json['birthDay'] as String?,
      addressName: json['addressName'] as String?,
      addressLat: json['addressLat'] as String?,
      addressLon: json['addressLon'] as String?,
      residenceCountryCode: json['residenceCountryCode'] as String?,
      nationalityCountryCode: json['nationalityCountryCode'] as String?,
      postalCode: json['postalCode'] as String?,
      typeChoisi: json['typeChoisi'] as String?,
      pathRecto: json['pathRecto'] as String?,
      pathVerso: json['pathVerso'] as String?,
      pathPassport: json['pathPassport'] as String?,
      pathSelfie: json['pathSelfie'] as String?,
    );

Map<String, dynamic> _$$KycFieldsDtoImplToJson(_$KycFieldsDtoImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'birthYear': instance.birthYear,
      'birthMonth': instance.birthMonth,
      'birthDay': instance.birthDay,
      'addressName': instance.addressName,
      'addressLat': instance.addressLat,
      'addressLon': instance.addressLon,
      'residenceCountryCode': instance.residenceCountryCode,
      'nationalityCountryCode': instance.nationalityCountryCode,
      'postalCode': instance.postalCode,
      'typeChoisi': instance.typeChoisi,
      'pathRecto': instance.pathRecto,
      'pathVerso': instance.pathVerso,
      'pathPassport': instance.pathPassport,
      'pathSelfie': instance.pathSelfie,
    };
