// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photon_address_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotonAddressCollectionImpl _$$PhotonAddressCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$PhotonAddressCollectionImpl(
      type: json['type'] as String?,
      features: (json['features'] as List<dynamic>?)
              ?.map(
                  (e) => PhotonAdressModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PhotonAddressCollectionImplToJson(
        _$PhotonAddressCollectionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features,
    };
