// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_submission_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycSubmissionResponseImpl _$$KycSubmissionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$KycSubmissionResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      requestId: json['requestId'] as String?,
    );

Map<String, dynamic> _$$KycSubmissionResponseImplToJson(
        _$KycSubmissionResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'requestId': instance.requestId,
    };
