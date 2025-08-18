// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRemoteImpl _$$UserRemoteImplFromJson(Map<String, dynamic> json) =>
    _$UserRemoteImpl(
      id: json['id'] as String,
      avatarId: json['avatarId'] as String? ?? '',
      status: json['status'] as String? ?? '',
      description: json['description'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$UserRemoteImplToJson(_$UserRemoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatarId': instance.avatarId,
      'status': instance.status,
      'description': instance.description,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
