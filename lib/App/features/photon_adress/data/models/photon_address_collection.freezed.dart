// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photon_address_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotonAddressCollection _$PhotonAddressCollectionFromJson(
    Map<String, dynamic> json) {
  return _PhotonAddressCollection.fromJson(json);
}

/// @nodoc
mixin _$PhotonAddressCollection {
  String? get type => throw _privateConstructorUsedError;
  List<PhotonAdressModel> get features => throw _privateConstructorUsedError;

  /// Serializes this PhotonAddressCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotonAddressCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotonAddressCollectionCopyWith<PhotonAddressCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotonAddressCollectionCopyWith<$Res> {
  factory $PhotonAddressCollectionCopyWith(PhotonAddressCollection value,
          $Res Function(PhotonAddressCollection) then) =
      _$PhotonAddressCollectionCopyWithImpl<$Res, PhotonAddressCollection>;
  @useResult
  $Res call({String? type, List<PhotonAdressModel> features});
}

/// @nodoc
class _$PhotonAddressCollectionCopyWithImpl<$Res,
        $Val extends PhotonAddressCollection>
    implements $PhotonAddressCollectionCopyWith<$Res> {
  _$PhotonAddressCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotonAddressCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<PhotonAdressModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotonAddressCollectionImplCopyWith<$Res>
    implements $PhotonAddressCollectionCopyWith<$Res> {
  factory _$$PhotonAddressCollectionImplCopyWith(
          _$PhotonAddressCollectionImpl value,
          $Res Function(_$PhotonAddressCollectionImpl) then) =
      __$$PhotonAddressCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, List<PhotonAdressModel> features});
}

/// @nodoc
class __$$PhotonAddressCollectionImplCopyWithImpl<$Res>
    extends _$PhotonAddressCollectionCopyWithImpl<$Res,
        _$PhotonAddressCollectionImpl>
    implements _$$PhotonAddressCollectionImplCopyWith<$Res> {
  __$$PhotonAddressCollectionImplCopyWithImpl(
      _$PhotonAddressCollectionImpl _value,
      $Res Function(_$PhotonAddressCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotonAddressCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? features = null,
  }) {
    return _then(_$PhotonAddressCollectionImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<PhotonAdressModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotonAddressCollectionImpl implements _PhotonAddressCollection {
  _$PhotonAddressCollectionImpl(
      {this.type, final List<PhotonAdressModel> features = const []})
      : _features = features;

  factory _$PhotonAddressCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotonAddressCollectionImplFromJson(json);

  @override
  final String? type;
  final List<PhotonAdressModel> _features;
  @override
  @JsonKey()
  List<PhotonAdressModel> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'PhotonAddressCollection(type: $type, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotonAddressCollectionImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_features));

  /// Create a copy of PhotonAddressCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotonAddressCollectionImplCopyWith<_$PhotonAddressCollectionImpl>
      get copyWith => __$$PhotonAddressCollectionImplCopyWithImpl<
          _$PhotonAddressCollectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotonAddressCollectionImplToJson(
      this,
    );
  }
}

abstract class _PhotonAddressCollection implements PhotonAddressCollection {
  factory _PhotonAddressCollection(
      {final String? type,
      final List<PhotonAdressModel> features}) = _$PhotonAddressCollectionImpl;

  factory _PhotonAddressCollection.fromJson(Map<String, dynamic> json) =
      _$PhotonAddressCollectionImpl.fromJson;

  @override
  String? get type;
  @override
  List<PhotonAdressModel> get features;

  /// Create a copy of PhotonAddressCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotonAddressCollectionImplCopyWith<_$PhotonAddressCollectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
