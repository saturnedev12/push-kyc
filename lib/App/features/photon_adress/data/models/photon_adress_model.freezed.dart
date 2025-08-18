// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photon_adress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotonAdressModel _$PhotonAdressModelFromJson(Map<String, dynamic> json) {
  return _PhotonAdressModel.fromJson(json);
}

/// @nodoc
mixin _$PhotonAdressModel {
  String get type => throw _privateConstructorUsedError;
  PhotonProperties get properties => throw _privateConstructorUsedError;
  PhotonGeometry get geometry => throw _privateConstructorUsedError;

  /// Serializes this PhotonAdressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotonAdressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotonAdressModelCopyWith<PhotonAdressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotonAdressModelCopyWith<$Res> {
  factory $PhotonAdressModelCopyWith(
          PhotonAdressModel value, $Res Function(PhotonAdressModel) then) =
      _$PhotonAdressModelCopyWithImpl<$Res, PhotonAdressModel>;
  @useResult
  $Res call(
      {String type, PhotonProperties properties, PhotonGeometry geometry});

  $PhotonPropertiesCopyWith<$Res> get properties;
  $PhotonGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$PhotonAdressModelCopyWithImpl<$Res, $Val extends PhotonAdressModel>
    implements $PhotonAdressModelCopyWith<$Res> {
  _$PhotonAdressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotonAdressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? properties = null,
    Object? geometry = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as PhotonProperties,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PhotonGeometry,
    ) as $Val);
  }

  /// Create a copy of PhotonAdressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhotonPropertiesCopyWith<$Res> get properties {
    return $PhotonPropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }

  /// Create a copy of PhotonAdressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhotonGeometryCopyWith<$Res> get geometry {
    return $PhotonGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotonAdressModelImplCopyWith<$Res>
    implements $PhotonAdressModelCopyWith<$Res> {
  factory _$$PhotonAdressModelImplCopyWith(_$PhotonAdressModelImpl value,
          $Res Function(_$PhotonAdressModelImpl) then) =
      __$$PhotonAdressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type, PhotonProperties properties, PhotonGeometry geometry});

  @override
  $PhotonPropertiesCopyWith<$Res> get properties;
  @override
  $PhotonGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$PhotonAdressModelImplCopyWithImpl<$Res>
    extends _$PhotonAdressModelCopyWithImpl<$Res, _$PhotonAdressModelImpl>
    implements _$$PhotonAdressModelImplCopyWith<$Res> {
  __$$PhotonAdressModelImplCopyWithImpl(_$PhotonAdressModelImpl _value,
      $Res Function(_$PhotonAdressModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotonAdressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? properties = null,
    Object? geometry = null,
  }) {
    return _then(_$PhotonAdressModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as PhotonProperties,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PhotonGeometry,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotonAdressModelImpl implements _PhotonAdressModel {
  const _$PhotonAdressModelImpl(
      {required this.type, required this.properties, required this.geometry});

  factory _$PhotonAdressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotonAdressModelImplFromJson(json);

  @override
  final String type;
  @override
  final PhotonProperties properties;
  @override
  final PhotonGeometry geometry;

  @override
  String toString() {
    return 'PhotonAdressModel(type: $type, properties: $properties, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotonAdressModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, properties, geometry);

  /// Create a copy of PhotonAdressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotonAdressModelImplCopyWith<_$PhotonAdressModelImpl> get copyWith =>
      __$$PhotonAdressModelImplCopyWithImpl<_$PhotonAdressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotonAdressModelImplToJson(
      this,
    );
  }
}

abstract class _PhotonAdressModel implements PhotonAdressModel {
  const factory _PhotonAdressModel(
      {required final String type,
      required final PhotonProperties properties,
      required final PhotonGeometry geometry}) = _$PhotonAdressModelImpl;

  factory _PhotonAdressModel.fromJson(Map<String, dynamic> json) =
      _$PhotonAdressModelImpl.fromJson;

  @override
  String get type;
  @override
  PhotonProperties get properties;
  @override
  PhotonGeometry get geometry;

  /// Create a copy of PhotonAdressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotonAdressModelImplCopyWith<_$PhotonAdressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhotonProperties _$PhotonPropertiesFromJson(Map<String, dynamic> json) {
  return _PhotonProperties.fromJson(json);
}

/// @nodoc
mixin _$PhotonProperties {
  @JsonKey(name: 'osm_type')
  String? get osmType => throw _privateConstructorUsedError;
  @JsonKey(name: 'osm_id')
  int? get osmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'osm_key')
  String? get osmKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'osm_value')
  String? get osmValue => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get countrycode => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this PhotonProperties to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotonProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotonPropertiesCopyWith<PhotonProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotonPropertiesCopyWith<$Res> {
  factory $PhotonPropertiesCopyWith(
          PhotonProperties value, $Res Function(PhotonProperties) then) =
      _$PhotonPropertiesCopyWithImpl<$Res, PhotonProperties>;
  @useResult
  $Res call(
      {@JsonKey(name: 'osm_type') String? osmType,
      @JsonKey(name: 'osm_id') int? osmId,
      @JsonKey(name: 'osm_key') String? osmKey,
      @JsonKey(name: 'osm_value') String? osmValue,
      String? type,
      String? countrycode,
      String? name,
      String? country,
      String? city,
      String? state});
}

/// @nodoc
class _$PhotonPropertiesCopyWithImpl<$Res, $Val extends PhotonProperties>
    implements $PhotonPropertiesCopyWith<$Res> {
  _$PhotonPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotonProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? osmType = freezed,
    Object? osmId = freezed,
    Object? osmKey = freezed,
    Object? osmValue = freezed,
    Object? type = freezed,
    Object? countrycode = freezed,
    Object? name = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      osmType: freezed == osmType
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String?,
      osmId: freezed == osmId
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int?,
      osmKey: freezed == osmKey
          ? _value.osmKey
          : osmKey // ignore: cast_nullable_to_non_nullable
              as String?,
      osmValue: freezed == osmValue
          ? _value.osmValue
          : osmValue // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      countrycode: freezed == countrycode
          ? _value.countrycode
          : countrycode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotonPropertiesImplCopyWith<$Res>
    implements $PhotonPropertiesCopyWith<$Res> {
  factory _$$PhotonPropertiesImplCopyWith(_$PhotonPropertiesImpl value,
          $Res Function(_$PhotonPropertiesImpl) then) =
      __$$PhotonPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'osm_type') String? osmType,
      @JsonKey(name: 'osm_id') int? osmId,
      @JsonKey(name: 'osm_key') String? osmKey,
      @JsonKey(name: 'osm_value') String? osmValue,
      String? type,
      String? countrycode,
      String? name,
      String? country,
      String? city,
      String? state});
}

/// @nodoc
class __$$PhotonPropertiesImplCopyWithImpl<$Res>
    extends _$PhotonPropertiesCopyWithImpl<$Res, _$PhotonPropertiesImpl>
    implements _$$PhotonPropertiesImplCopyWith<$Res> {
  __$$PhotonPropertiesImplCopyWithImpl(_$PhotonPropertiesImpl _value,
      $Res Function(_$PhotonPropertiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotonProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? osmType = freezed,
    Object? osmId = freezed,
    Object? osmKey = freezed,
    Object? osmValue = freezed,
    Object? type = freezed,
    Object? countrycode = freezed,
    Object? name = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? state = freezed,
  }) {
    return _then(_$PhotonPropertiesImpl(
      osmType: freezed == osmType
          ? _value.osmType
          : osmType // ignore: cast_nullable_to_non_nullable
              as String?,
      osmId: freezed == osmId
          ? _value.osmId
          : osmId // ignore: cast_nullable_to_non_nullable
              as int?,
      osmKey: freezed == osmKey
          ? _value.osmKey
          : osmKey // ignore: cast_nullable_to_non_nullable
              as String?,
      osmValue: freezed == osmValue
          ? _value.osmValue
          : osmValue // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      countrycode: freezed == countrycode
          ? _value.countrycode
          : countrycode // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotonPropertiesImpl implements _PhotonProperties {
  const _$PhotonPropertiesImpl(
      {@JsonKey(name: 'osm_type') this.osmType,
      @JsonKey(name: 'osm_id') this.osmId,
      @JsonKey(name: 'osm_key') this.osmKey,
      @JsonKey(name: 'osm_value') this.osmValue,
      this.type,
      this.countrycode,
      this.name,
      this.country,
      this.city,
      this.state});

  factory _$PhotonPropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotonPropertiesImplFromJson(json);

  @override
  @JsonKey(name: 'osm_type')
  final String? osmType;
  @override
  @JsonKey(name: 'osm_id')
  final int? osmId;
  @override
  @JsonKey(name: 'osm_key')
  final String? osmKey;
  @override
  @JsonKey(name: 'osm_value')
  final String? osmValue;
  @override
  final String? type;
  @override
  final String? countrycode;
  @override
  final String? name;
  @override
  final String? country;
  @override
  final String? city;
  @override
  final String? state;

  @override
  String toString() {
    return 'PhotonProperties(osmType: $osmType, osmId: $osmId, osmKey: $osmKey, osmValue: $osmValue, type: $type, countrycode: $countrycode, name: $name, country: $country, city: $city, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotonPropertiesImpl &&
            (identical(other.osmType, osmType) || other.osmType == osmType) &&
            (identical(other.osmId, osmId) || other.osmId == osmId) &&
            (identical(other.osmKey, osmKey) || other.osmKey == osmKey) &&
            (identical(other.osmValue, osmValue) ||
                other.osmValue == osmValue) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.countrycode, countrycode) ||
                other.countrycode == countrycode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, osmType, osmId, osmKey, osmValue,
      type, countrycode, name, country, city, state);

  /// Create a copy of PhotonProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotonPropertiesImplCopyWith<_$PhotonPropertiesImpl> get copyWith =>
      __$$PhotonPropertiesImplCopyWithImpl<_$PhotonPropertiesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotonPropertiesImplToJson(
      this,
    );
  }
}

abstract class _PhotonProperties implements PhotonProperties {
  const factory _PhotonProperties(
      {@JsonKey(name: 'osm_type') final String? osmType,
      @JsonKey(name: 'osm_id') final int? osmId,
      @JsonKey(name: 'osm_key') final String? osmKey,
      @JsonKey(name: 'osm_value') final String? osmValue,
      final String? type,
      final String? countrycode,
      final String? name,
      final String? country,
      final String? city,
      final String? state}) = _$PhotonPropertiesImpl;

  factory _PhotonProperties.fromJson(Map<String, dynamic> json) =
      _$PhotonPropertiesImpl.fromJson;

  @override
  @JsonKey(name: 'osm_type')
  String? get osmType;
  @override
  @JsonKey(name: 'osm_id')
  int? get osmId;
  @override
  @JsonKey(name: 'osm_key')
  String? get osmKey;
  @override
  @JsonKey(name: 'osm_value')
  String? get osmValue;
  @override
  String? get type;
  @override
  String? get countrycode;
  @override
  String? get name;
  @override
  String? get country;
  @override
  String? get city;
  @override
  String? get state;

  /// Create a copy of PhotonProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotonPropertiesImplCopyWith<_$PhotonPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhotonGeometry _$PhotonGeometryFromJson(Map<String, dynamic> json) {
  return _PhotonGeometry.fromJson(json);
}

/// @nodoc
mixin _$PhotonGeometry {
  String get type => throw _privateConstructorUsedError;

  /// Toujours [lon, lat]
  @JsonKey(fromJson: _toDoubleList, toJson: _fromDoubleList)
  List<double> get coordinates => throw _privateConstructorUsedError;

  /// Serializes this PhotonGeometry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotonGeometry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotonGeometryCopyWith<PhotonGeometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotonGeometryCopyWith<$Res> {
  factory $PhotonGeometryCopyWith(
          PhotonGeometry value, $Res Function(PhotonGeometry) then) =
      _$PhotonGeometryCopyWithImpl<$Res, PhotonGeometry>;
  @useResult
  $Res call(
      {String type,
      @JsonKey(fromJson: _toDoubleList, toJson: _fromDoubleList)
      List<double> coordinates});
}

/// @nodoc
class _$PhotonGeometryCopyWithImpl<$Res, $Val extends PhotonGeometry>
    implements $PhotonGeometryCopyWith<$Res> {
  _$PhotonGeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotonGeometry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotonGeometryImplCopyWith<$Res>
    implements $PhotonGeometryCopyWith<$Res> {
  factory _$$PhotonGeometryImplCopyWith(_$PhotonGeometryImpl value,
          $Res Function(_$PhotonGeometryImpl) then) =
      __$$PhotonGeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      @JsonKey(fromJson: _toDoubleList, toJson: _fromDoubleList)
      List<double> coordinates});
}

/// @nodoc
class __$$PhotonGeometryImplCopyWithImpl<$Res>
    extends _$PhotonGeometryCopyWithImpl<$Res, _$PhotonGeometryImpl>
    implements _$$PhotonGeometryImplCopyWith<$Res> {
  __$$PhotonGeometryImplCopyWithImpl(
      _$PhotonGeometryImpl _value, $Res Function(_$PhotonGeometryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotonGeometry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_$PhotonGeometryImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotonGeometryImpl implements _PhotonGeometry {
  const _$PhotonGeometryImpl(
      {required this.type,
      @JsonKey(fromJson: _toDoubleList, toJson: _fromDoubleList)
      required final List<double> coordinates})
      : _coordinates = coordinates;

  factory _$PhotonGeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotonGeometryImplFromJson(json);

  @override
  final String type;

  /// Toujours [lon, lat]
  final List<double> _coordinates;

  /// Toujours [lon, lat]
  @override
  @JsonKey(fromJson: _toDoubleList, toJson: _fromDoubleList)
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'PhotonGeometry(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotonGeometryImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  /// Create a copy of PhotonGeometry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotonGeometryImplCopyWith<_$PhotonGeometryImpl> get copyWith =>
      __$$PhotonGeometryImplCopyWithImpl<_$PhotonGeometryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotonGeometryImplToJson(
      this,
    );
  }
}

abstract class _PhotonGeometry implements PhotonGeometry {
  const factory _PhotonGeometry(
      {required final String type,
      @JsonKey(fromJson: _toDoubleList, toJson: _fromDoubleList)
      required final List<double> coordinates}) = _$PhotonGeometryImpl;

  factory _PhotonGeometry.fromJson(Map<String, dynamic> json) =
      _$PhotonGeometryImpl.fromJson;

  @override
  String get type;

  /// Toujours [lon, lat]
  @override
  @JsonKey(fromJson: _toDoubleList, toJson: _fromDoubleList)
  List<double> get coordinates;

  /// Create a copy of PhotonGeometry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotonGeometryImplCopyWith<_$PhotonGeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
