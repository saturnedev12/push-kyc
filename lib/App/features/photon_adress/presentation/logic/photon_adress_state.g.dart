// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photon_adress_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotonAdressStateImpl _$$PhotonAdressStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PhotonAdressStateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PhotonAdressStateImplToJson(
        _$PhotonAdressStateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PHOTON_REQUEST_INITIALImpl _$$PHOTON_REQUEST_INITIALImplFromJson(
        Map<String, dynamic> json) =>
    _$PHOTON_REQUEST_INITIALImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PHOTON_REQUEST_INITIALImplToJson(
        _$PHOTON_REQUEST_INITIALImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PHOTON_REQUEST_LOADINGImpl _$$PHOTON_REQUEST_LOADINGImplFromJson(
        Map<String, dynamic> json) =>
    _$PHOTON_REQUEST_LOADINGImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PHOTON_REQUEST_LOADINGImplToJson(
        _$PHOTON_REQUEST_LOADINGImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$PHOTON_REQUEST_SUCCESSImpl _$$PHOTON_REQUEST_SUCCESSImplFromJson(
        Map<String, dynamic> json) =>
    _$PHOTON_REQUEST_SUCCESSImpl(
      (json['datas'] as List<dynamic>)
          .map((e) => PhotonAdressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PHOTON_REQUEST_SUCCESSImplToJson(
        _$PHOTON_REQUEST_SUCCESSImpl instance) =>
    <String, dynamic>{
      'datas': instance.datas,
      'runtimeType': instance.$type,
    };
