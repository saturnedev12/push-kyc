// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_submission_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KycSubmissionResponse _$KycSubmissionResponseFromJson(
    Map<String, dynamic> json) {
  return _KycSubmissionResponse.fromJson(json);
}

/// @nodoc
mixin _$KycSubmissionResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Serializes this KycSubmissionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KycSubmissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KycSubmissionResponseCopyWith<KycSubmissionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycSubmissionResponseCopyWith<$Res> {
  factory $KycSubmissionResponseCopyWith(KycSubmissionResponse value,
          $Res Function(KycSubmissionResponse) then) =
      _$KycSubmissionResponseCopyWithImpl<$Res, KycSubmissionResponse>;
  @useResult
  $Res call({bool success, String? message, String? requestId});
}

/// @nodoc
class _$KycSubmissionResponseCopyWithImpl<$Res,
        $Val extends KycSubmissionResponse>
    implements $KycSubmissionResponseCopyWith<$Res> {
  _$KycSubmissionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KycSubmissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? requestId = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KycSubmissionResponseImplCopyWith<$Res>
    implements $KycSubmissionResponseCopyWith<$Res> {
  factory _$$KycSubmissionResponseImplCopyWith(
          _$KycSubmissionResponseImpl value,
          $Res Function(_$KycSubmissionResponseImpl) then) =
      __$$KycSubmissionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, String? requestId});
}

/// @nodoc
class __$$KycSubmissionResponseImplCopyWithImpl<$Res>
    extends _$KycSubmissionResponseCopyWithImpl<$Res,
        _$KycSubmissionResponseImpl>
    implements _$$KycSubmissionResponseImplCopyWith<$Res> {
  __$$KycSubmissionResponseImplCopyWithImpl(_$KycSubmissionResponseImpl _value,
      $Res Function(_$KycSubmissionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of KycSubmissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? requestId = freezed,
  }) {
    return _then(_$KycSubmissionResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycSubmissionResponseImpl implements _KycSubmissionResponse {
  const _$KycSubmissionResponseImpl(
      {required this.success, this.message, this.requestId});

  factory _$KycSubmissionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycSubmissionResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'KycSubmissionResponse(success: $success, message: $message, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycSubmissionResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, requestId);

  /// Create a copy of KycSubmissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KycSubmissionResponseImplCopyWith<_$KycSubmissionResponseImpl>
      get copyWith => __$$KycSubmissionResponseImplCopyWithImpl<
          _$KycSubmissionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycSubmissionResponseImplToJson(
      this,
    );
  }
}

abstract class _KycSubmissionResponse implements KycSubmissionResponse {
  const factory _KycSubmissionResponse(
      {required final bool success,
      final String? message,
      final String? requestId}) = _$KycSubmissionResponseImpl;

  factory _KycSubmissionResponse.fromJson(Map<String, dynamic> json) =
      _$KycSubmissionResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  String? get requestId;

  /// Create a copy of KycSubmissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KycSubmissionResponseImplCopyWith<_$KycSubmissionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
