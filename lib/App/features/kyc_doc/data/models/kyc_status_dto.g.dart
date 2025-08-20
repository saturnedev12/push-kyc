// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycStatusDtoImpl _$$KycStatusDtoImplFromJson(Map<String, dynamic> json) =>
    _$KycStatusDtoImpl(
      overall: json['overall'] as String?,
      fields: KycFieldsDto.fromJson(json['fields'] as Map<String, dynamic>),
      reasons: (json['reasons'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const <String, String>{},
      requestId: json['requestId'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$KycStatusDtoImplToJson(_$KycStatusDtoImpl instance) =>
    <String, dynamic>{
      'overall': instance.overall,
      'fields': instance.fields,
      'reasons': instance.reasons,
      'requestId': instance.requestId,
      'updatedAt': instance.updatedAt,
    };
