// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonalInfoDto _$PersonalInfoDtoFromJson(Map<String, dynamic> json) {
  return _PersonalInfoDto.fromJson(json);
}

/// @nodoc
mixin _$PersonalInfoDto {
// Identité
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get sexe => throw _privateConstructorUsedError; // Naissance
  int? get birthYear => throw _privateConstructorUsedError;
  int? get birthMonth => throw _privateConstructorUsedError;
  int? get birthDay => throw _privateConstructorUsedError; // Adresse & pays
  String? get addressName =>
      throw _privateConstructorUsedError; // "Le Plateau, Abidjan"
  double? get addressLon => throw _privateConstructorUsedError;
  double? get addressLat => throw _privateConstructorUsedError;
  String? get residenceCountryCode =>
      throw _privateConstructorUsedError; // "CI"
  String? get nationalityCountryCode =>
      throw _privateConstructorUsedError; // "CI"
  String? get postalCode => throw _privateConstructorUsedError;

  /// Serializes this PersonalInfoDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalInfoDtoCopyWith<PersonalInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoDtoCopyWith<$Res> {
  factory $PersonalInfoDtoCopyWith(
          PersonalInfoDto value, $Res Function(PersonalInfoDto) then) =
      _$PersonalInfoDtoCopyWithImpl<$Res, PersonalInfoDto>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      String? sexe,
      int? birthYear,
      int? birthMonth,
      int? birthDay,
      String? addressName,
      double? addressLon,
      double? addressLat,
      String? residenceCountryCode,
      String? nationalityCountryCode,
      String? postalCode});
}

/// @nodoc
class _$PersonalInfoDtoCopyWithImpl<$Res, $Val extends PersonalInfoDto>
    implements $PersonalInfoDtoCopyWith<$Res> {
  _$PersonalInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? sexe = freezed,
    Object? birthYear = freezed,
    Object? birthMonth = freezed,
    Object? birthDay = freezed,
    Object? addressName = freezed,
    Object? addressLon = freezed,
    Object? addressLat = freezed,
    Object? residenceCountryCode = freezed,
    Object? nationalityCountryCode = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String?,
      birthYear: freezed == birthYear
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      birthMonth: freezed == birthMonth
          ? _value.birthMonth
          : birthMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as int?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLon: freezed == addressLon
          ? _value.addressLon
          : addressLon // ignore: cast_nullable_to_non_nullable
              as double?,
      addressLat: freezed == addressLat
          ? _value.addressLat
          : addressLat // ignore: cast_nullable_to_non_nullable
              as double?,
      residenceCountryCode: freezed == residenceCountryCode
          ? _value.residenceCountryCode
          : residenceCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityCountryCode: freezed == nationalityCountryCode
          ? _value.nationalityCountryCode
          : nationalityCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalInfoDtoImplCopyWith<$Res>
    implements $PersonalInfoDtoCopyWith<$Res> {
  factory _$$PersonalInfoDtoImplCopyWith(_$PersonalInfoDtoImpl value,
          $Res Function(_$PersonalInfoDtoImpl) then) =
      __$$PersonalInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      String? sexe,
      int? birthYear,
      int? birthMonth,
      int? birthDay,
      String? addressName,
      double? addressLon,
      double? addressLat,
      String? residenceCountryCode,
      String? nationalityCountryCode,
      String? postalCode});
}

/// @nodoc
class __$$PersonalInfoDtoImplCopyWithImpl<$Res>
    extends _$PersonalInfoDtoCopyWithImpl<$Res, _$PersonalInfoDtoImpl>
    implements _$$PersonalInfoDtoImplCopyWith<$Res> {
  __$$PersonalInfoDtoImplCopyWithImpl(
      _$PersonalInfoDtoImpl _value, $Res Function(_$PersonalInfoDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonalInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? sexe = freezed,
    Object? birthYear = freezed,
    Object? birthMonth = freezed,
    Object? birthDay = freezed,
    Object? addressName = freezed,
    Object? addressLon = freezed,
    Object? addressLat = freezed,
    Object? residenceCountryCode = freezed,
    Object? nationalityCountryCode = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_$PersonalInfoDtoImpl(
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
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String?,
      birthYear: freezed == birthYear
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      birthMonth: freezed == birthMonth
          ? _value.birthMonth
          : birthMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as int?,
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLon: freezed == addressLon
          ? _value.addressLon
          : addressLon // ignore: cast_nullable_to_non_nullable
              as double?,
      addressLat: freezed == addressLat
          ? _value.addressLat
          : addressLat // ignore: cast_nullable_to_non_nullable
              as double?,
      residenceCountryCode: freezed == residenceCountryCode
          ? _value.residenceCountryCode
          : residenceCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityCountryCode: freezed == nationalityCountryCode
          ? _value.nationalityCountryCode
          : nationalityCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalInfoDtoImpl implements _PersonalInfoDto {
  const _$PersonalInfoDtoImpl(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.sexe,
      this.birthYear,
      this.birthMonth,
      this.birthDay,
      this.addressName,
      this.addressLon,
      this.addressLat,
      this.residenceCountryCode,
      this.nationalityCountryCode,
      this.postalCode});

  factory _$PersonalInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalInfoDtoImplFromJson(json);

// Identité
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? sexe;
// Naissance
  @override
  final int? birthYear;
  @override
  final int? birthMonth;
  @override
  final int? birthDay;
// Adresse & pays
  @override
  final String? addressName;
// "Le Plateau, Abidjan"
  @override
  final double? addressLon;
  @override
  final double? addressLat;
  @override
  final String? residenceCountryCode;
// "CI"
  @override
  final String? nationalityCountryCode;
// "CI"
  @override
  final String? postalCode;

  @override
  String toString() {
    return 'PersonalInfoDto(firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, sexe: $sexe, birthYear: $birthYear, birthMonth: $birthMonth, birthDay: $birthDay, addressName: $addressName, addressLon: $addressLon, addressLat: $addressLat, residenceCountryCode: $residenceCountryCode, nationalityCountryCode: $nationalityCountryCode, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalInfoDtoImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear) &&
            (identical(other.birthMonth, birthMonth) ||
                other.birthMonth == birthMonth) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.addressLon, addressLon) ||
                other.addressLon == addressLon) &&
            (identical(other.addressLat, addressLat) ||
                other.addressLat == addressLat) &&
            (identical(other.residenceCountryCode, residenceCountryCode) ||
                other.residenceCountryCode == residenceCountryCode) &&
            (identical(other.nationalityCountryCode, nationalityCountryCode) ||
                other.nationalityCountryCode == nationalityCountryCode) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      phoneNumber,
      sexe,
      birthYear,
      birthMonth,
      birthDay,
      addressName,
      addressLon,
      addressLat,
      residenceCountryCode,
      nationalityCountryCode,
      postalCode);

  /// Create a copy of PersonalInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalInfoDtoImplCopyWith<_$PersonalInfoDtoImpl> get copyWith =>
      __$$PersonalInfoDtoImplCopyWithImpl<_$PersonalInfoDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _PersonalInfoDto implements PersonalInfoDto {
  const factory _PersonalInfoDto(
      {final String? firstName,
      final String? lastName,
      final String? email,
      final String? phoneNumber,
      final String? sexe,
      final int? birthYear,
      final int? birthMonth,
      final int? birthDay,
      final String? addressName,
      final double? addressLon,
      final double? addressLat,
      final String? residenceCountryCode,
      final String? nationalityCountryCode,
      final String? postalCode}) = _$PersonalInfoDtoImpl;

  factory _PersonalInfoDto.fromJson(Map<String, dynamic> json) =
      _$PersonalInfoDtoImpl.fromJson;

// Identité
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get sexe; // Naissance
  @override
  int? get birthYear;
  @override
  int? get birthMonth;
  @override
  int? get birthDay; // Adresse & pays
  @override
  String? get addressName; // "Le Plateau, Abidjan"
  @override
  double? get addressLon;
  @override
  double? get addressLat;
  @override
  String? get residenceCountryCode; // "CI"
  @override
  String? get nationalityCountryCode; // "CI"
  @override
  String? get postalCode;

  /// Create a copy of PersonalInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalInfoDtoImplCopyWith<_$PersonalInfoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
