// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KycStatusDto _$KycStatusDtoFromJson(Map<String, dynamic> json) {
  return _KycStatusDto.fromJson(json);
}

/// @nodoc
mixin _$KycStatusDto {
  String? get overall => throw _privateConstructorUsedError;
  KycFieldsDto get fields => throw _privateConstructorUsedError;
  Map<String, String> get reasons => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this KycStatusDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KycStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KycStatusDtoCopyWith<KycStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycStatusDtoCopyWith<$Res> {
  factory $KycStatusDtoCopyWith(
          KycStatusDto value, $Res Function(KycStatusDto) then) =
      _$KycStatusDtoCopyWithImpl<$Res, KycStatusDto>;
  @useResult
  $Res call(
      {String? overall,
      KycFieldsDto fields,
      Map<String, String> reasons,
      String? requestId,
      String? updatedAt});

  $KycFieldsDtoCopyWith<$Res> get fields;
}

/// @nodoc
class _$KycStatusDtoCopyWithImpl<$Res, $Val extends KycStatusDto>
    implements $KycStatusDtoCopyWith<$Res> {
  _$KycStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KycStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overall = freezed,
    Object? fields = null,
    Object? reasons = null,
    Object? requestId = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      overall: freezed == overall
          ? _value.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as String?,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as KycFieldsDto,
      reasons: null == reasons
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of KycStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KycFieldsDtoCopyWith<$Res> get fields {
    return $KycFieldsDtoCopyWith<$Res>(_value.fields, (value) {
      return _then(_value.copyWith(fields: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KycStatusDtoImplCopyWith<$Res>
    implements $KycStatusDtoCopyWith<$Res> {
  factory _$$KycStatusDtoImplCopyWith(
          _$KycStatusDtoImpl value, $Res Function(_$KycStatusDtoImpl) then) =
      __$$KycStatusDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? overall,
      KycFieldsDto fields,
      Map<String, String> reasons,
      String? requestId,
      String? updatedAt});

  @override
  $KycFieldsDtoCopyWith<$Res> get fields;
}

/// @nodoc
class __$$KycStatusDtoImplCopyWithImpl<$Res>
    extends _$KycStatusDtoCopyWithImpl<$Res, _$KycStatusDtoImpl>
    implements _$$KycStatusDtoImplCopyWith<$Res> {
  __$$KycStatusDtoImplCopyWithImpl(
      _$KycStatusDtoImpl _value, $Res Function(_$KycStatusDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of KycStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overall = freezed,
    Object? fields = null,
    Object? reasons = null,
    Object? requestId = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$KycStatusDtoImpl(
      overall: freezed == overall
          ? _value.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as String?,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as KycFieldsDto,
      reasons: null == reasons
          ? _value._reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycStatusDtoImpl implements _KycStatusDto {
  const _$KycStatusDtoImpl(
      {this.overall,
      required this.fields,
      final Map<String, String> reasons = const <String, String>{},
      this.requestId,
      this.updatedAt})
      : _reasons = reasons;

  factory _$KycStatusDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycStatusDtoImplFromJson(json);

  @override
  final String? overall;
  @override
  final KycFieldsDto fields;
  final Map<String, String> _reasons;
  @override
  @JsonKey()
  Map<String, String> get reasons {
    if (_reasons is EqualUnmodifiableMapView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reasons);
  }

  @override
  final String? requestId;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'KycStatusDto(overall: $overall, fields: $fields, reasons: $reasons, requestId: $requestId, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycStatusDtoImpl &&
            (identical(other.overall, overall) || other.overall == overall) &&
            (identical(other.fields, fields) || other.fields == fields) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, overall, fields,
      const DeepCollectionEquality().hash(_reasons), requestId, updatedAt);

  /// Create a copy of KycStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KycStatusDtoImplCopyWith<_$KycStatusDtoImpl> get copyWith =>
      __$$KycStatusDtoImplCopyWithImpl<_$KycStatusDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycStatusDtoImplToJson(
      this,
    );
  }
}

abstract class _KycStatusDto implements KycStatusDto {
  const factory _KycStatusDto(
      {final String? overall,
      required final KycFieldsDto fields,
      final Map<String, String> reasons,
      final String? requestId,
      final String? updatedAt}) = _$KycStatusDtoImpl;

  factory _KycStatusDto.fromJson(Map<String, dynamic> json) =
      _$KycStatusDtoImpl.fromJson;

  @override
  String? get overall;
  @override
  KycFieldsDto get fields;
  @override
  Map<String, String> get reasons;
  @override
  String? get requestId;
  @override
  String? get updatedAt;

  /// Create a copy of KycStatusDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KycStatusDtoImplCopyWith<_$KycStatusDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
