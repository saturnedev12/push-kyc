// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photon_adress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotonAdressModelImpl _$$PhotonAdressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PhotonAdressModelImpl(
      type: json['type'] as String,
      properties:
          PhotonProperties.fromJson(json['properties'] as Map<String, dynamic>),
      geometry:
          PhotonGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PhotonAdressModelImplToJson(
        _$PhotonAdressModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

_$PhotonPropertiesImpl _$$PhotonPropertiesImplFromJson(
        Map<String, dynamic> json) =>
    _$PhotonPropertiesImpl(
      osmType: json['osm_type'] as String?,
      osmId: (json['osm_id'] as num?)?.toInt(),
      osmKey: json['osm_key'] as String?,
      osmValue: json['osm_value'] as String?,
      type: json['type'] as String?,
      countrycode: json['countrycode'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$PhotonPropertiesImplToJson(
        _$PhotonPropertiesImpl instance) =>
    <String, dynamic>{
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'osm_key': instance.osmKey,
      'osm_value': instance.osmValue,
      'type': instance.type,
      'countrycode': instance.countrycode,
      'name': instance.name,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
    };

_$PhotonGeometryImpl _$$PhotonGeometryImplFromJson(Map<String, dynamic> json) =>
    _$PhotonGeometryImpl(
      type: json['type'] as String,
      coordinates: _toDoubleList(json['coordinates'] as List?),
    );

Map<String, dynamic> _$$PhotonGeometryImplToJson(
        _$PhotonGeometryImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': _fromDoubleList(instance.coordinates),
    };
