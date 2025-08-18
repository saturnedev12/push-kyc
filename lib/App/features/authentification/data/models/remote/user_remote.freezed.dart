// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_remote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRemote _$UserRemoteFromJson(Map<String, dynamic> json) {
  return _UserRemote.fromJson(json);
}

/// @nodoc
mixin _$UserRemote {
  String get id => throw _privateConstructorUsedError;
  String? get avatarId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this UserRemote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRemote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRemoteCopyWith<UserRemote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRemoteCopyWith<$Res> {
  factory $UserRemoteCopyWith(
          UserRemote value, $Res Function(UserRemote) then) =
      _$UserRemoteCopyWithImpl<$Res, UserRemote>;
  @useResult
  $Res call(
      {String id,
      String? avatarId,
      String? status,
      String? description,
      String? firstName,
      String? lastName,
      String? email});
}

/// @nodoc
class _$UserRemoteCopyWithImpl<$Res, $Val extends UserRemote>
    implements $UserRemoteCopyWith<$Res> {
  _$UserRemoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRemote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatarId = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatarId: freezed == avatarId
          ? _value.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRemoteImplCopyWith<$Res>
    implements $UserRemoteCopyWith<$Res> {
  factory _$$UserRemoteImplCopyWith(
          _$UserRemoteImpl value, $Res Function(_$UserRemoteImpl) then) =
      __$$UserRemoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? avatarId,
      String? status,
      String? description,
      String? firstName,
      String? lastName,
      String? email});
}

/// @nodoc
class __$$UserRemoteImplCopyWithImpl<$Res>
    extends _$UserRemoteCopyWithImpl<$Res, _$UserRemoteImpl>
    implements _$$UserRemoteImplCopyWith<$Res> {
  __$$UserRemoteImplCopyWithImpl(
      _$UserRemoteImpl _value, $Res Function(_$UserRemoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRemote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatarId = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
  }) {
    return _then(_$UserRemoteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avatarId: freezed == avatarId
          ? _value.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRemoteImpl implements _UserRemote {
  const _$UserRemoteImpl(
      {required this.id,
      this.avatarId = '',
      this.status = '',
      this.description = '',
      this.firstName = '',
      this.lastName = '',
      this.email = ''});

  factory _$UserRemoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRemoteImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String? avatarId;
  @override
  @JsonKey()
  final String? status;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final String? firstName;
  @override
  @JsonKey()
  final String? lastName;
  @override
  @JsonKey()
  final String? email;

  @override
  String toString() {
    return 'UserRemote(id: $id, avatarId: $avatarId, status: $status, description: $description, firstName: $firstName, lastName: $lastName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRemoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatarId, avatarId) ||
                other.avatarId == avatarId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, avatarId, status,
      description, firstName, lastName, email);

  /// Create a copy of UserRemote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRemoteImplCopyWith<_$UserRemoteImpl> get copyWith =>
      __$$UserRemoteImplCopyWithImpl<_$UserRemoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRemoteImplToJson(
      this,
    );
  }
}

abstract class _UserRemote implements UserRemote {
  const factory _UserRemote(
      {required final String id,
      final String? avatarId,
      final String? status,
      final String? description,
      final String? firstName,
      final String? lastName,
      final String? email}) = _$UserRemoteImpl;

  factory _UserRemote.fromJson(Map<String, dynamic> json) =
      _$UserRemoteImpl.fromJson;

  @override
  String get id;
  @override
  String? get avatarId;
  @override
  String? get status;
  @override
  String? get description;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;

  /// Create a copy of UserRemote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRemoteImplCopyWith<_$UserRemoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
