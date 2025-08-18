import 'package:freezed_annotation/freezed_annotation.dart';

part 'photon_adress_model.freezed.dart';
part 'photon_adress_model.g.dart';

@freezed
class PhotonAdressModel with _$PhotonAdressModel {
  const factory PhotonAdressModel({
    required String type,
    required PhotonProperties properties,
    required PhotonGeometry geometry,
  }) = _PhotonAdressModel;

  factory PhotonAdressModel.fromJson(Map<String, dynamic> json) =>
      _$PhotonAdressModelFromJson(json);
}

@freezed
class PhotonProperties with _$PhotonProperties {
  const factory PhotonProperties({
    @JsonKey(name: 'osm_type') String? osmType,
    @JsonKey(name: 'osm_id') int? osmId,
    @JsonKey(name: 'osm_key') String? osmKey,
    @JsonKey(name: 'osm_value') String? osmValue,
    String? type,
    String? countrycode,
    String? name,
    String? country,
    String? city,
    String? state,
  }) = _PhotonProperties;

  factory PhotonProperties.fromJson(Map<String, dynamic> json) =>
      _$PhotonPropertiesFromJson(json);
}

@freezed
class PhotonGeometry with _$PhotonGeometry {
  const factory PhotonGeometry({
    required String type,

    /// Toujours [lon, lat]
    @JsonKey(fromJson: _toDoubleList, toJson: _fromDoubleList)
    required List<double> coordinates,
  }) = _PhotonGeometry;

  factory PhotonGeometry.fromJson(Map<String, dynamic> json) =>
      _$PhotonGeometryFromJson(json);
}

/// Helpers pour caster la liste JSON → List<double>
List<double> _toDoubleList(List<dynamic>? list) =>
    list?.map((e) => (e as num).toDouble()).toList() ?? [];

List<dynamic> _fromDoubleList(List<double>? list) => list ?? [];
