// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photon_adress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotonAdressState _$PhotonAdressStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _PhotonAdressState.fromJson(json);
    case 'initial':
      return PHOTON_REQUEST_INITIAL.fromJson(json);
    case 'loading':
      return PHOTON_REQUEST_LOADING.fromJson(json);
    case 'success':
      return PHOTON_REQUEST_SUCCESS.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PhotonAdressState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PhotonAdressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PhotonAdressModel> datas) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PhotonAdressModel> datas)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PhotonAdressModel> datas)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PhotonAdressState value) $default, {
    required TResult Function(PHOTON_REQUEST_INITIAL value) initial,
    required TResult Function(PHOTON_REQUEST_LOADING value) loading,
    required TResult Function(PHOTON_REQUEST_SUCCESS value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PhotonAdressState value)? $default, {
    TResult? Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult? Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult? Function(PHOTON_REQUEST_SUCCESS value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PhotonAdressState value)? $default, {
    TResult Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult Function(PHOTON_REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PhotonAdressState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotonAdressStateCopyWith<$Res> {
  factory $PhotonAdressStateCopyWith(
          PhotonAdressState value, $Res Function(PhotonAdressState) then) =
      _$PhotonAdressStateCopyWithImpl<$Res, PhotonAdressState>;
}

/// @nodoc
class _$PhotonAdressStateCopyWithImpl<$Res, $Val extends PhotonAdressState>
    implements $PhotonAdressStateCopyWith<$Res> {
  _$PhotonAdressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotonAdressState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PhotonAdressStateImplCopyWith<$Res> {
  factory _$$PhotonAdressStateImplCopyWith(_$PhotonAdressStateImpl value,
          $Res Function(_$PhotonAdressStateImpl) then) =
      __$$PhotonAdressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PhotonAdressStateImplCopyWithImpl<$Res>
    extends _$PhotonAdressStateCopyWithImpl<$Res, _$PhotonAdressStateImpl>
    implements _$$PhotonAdressStateImplCopyWith<$Res> {
  __$$PhotonAdressStateImplCopyWithImpl(_$PhotonAdressStateImpl _value,
      $Res Function(_$PhotonAdressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotonAdressState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PhotonAdressStateImpl implements _PhotonAdressState {
  _$PhotonAdressStateImpl({final String? $type}) : $type = $type ?? 'default';

  factory _$PhotonAdressStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotonAdressStateImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PhotonAdressState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PhotonAdressStateImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PhotonAdressModel> datas) success,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PhotonAdressModel> datas)? success,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PhotonAdressModel> datas)? success,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PhotonAdressState value) $default, {
    required TResult Function(PHOTON_REQUEST_INITIAL value) initial,
    required TResult Function(PHOTON_REQUEST_LOADING value) loading,
    required TResult Function(PHOTON_REQUEST_SUCCESS value) success,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PhotonAdressState value)? $default, {
    TResult? Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult? Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult? Function(PHOTON_REQUEST_SUCCESS value)? success,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PhotonAdressState value)? $default, {
    TResult Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult Function(PHOTON_REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotonAdressStateImplToJson(
      this,
    );
  }
}

abstract class _PhotonAdressState implements PhotonAdressState {
  factory _PhotonAdressState() = _$PhotonAdressStateImpl;

  factory _PhotonAdressState.fromJson(Map<String, dynamic> json) =
      _$PhotonAdressStateImpl.fromJson;
}

/// @nodoc
abstract class _$$PHOTON_REQUEST_INITIALImplCopyWith<$Res> {
  factory _$$PHOTON_REQUEST_INITIALImplCopyWith(
          _$PHOTON_REQUEST_INITIALImpl value,
          $Res Function(_$PHOTON_REQUEST_INITIALImpl) then) =
      __$$PHOTON_REQUEST_INITIALImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PHOTON_REQUEST_INITIALImplCopyWithImpl<$Res>
    extends _$PhotonAdressStateCopyWithImpl<$Res, _$PHOTON_REQUEST_INITIALImpl>
    implements _$$PHOTON_REQUEST_INITIALImplCopyWith<$Res> {
  __$$PHOTON_REQUEST_INITIALImplCopyWithImpl(
      _$PHOTON_REQUEST_INITIALImpl _value,
      $Res Function(_$PHOTON_REQUEST_INITIALImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotonAdressState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PHOTON_REQUEST_INITIALImpl implements PHOTON_REQUEST_INITIAL {
  const _$PHOTON_REQUEST_INITIALImpl({final String? $type})
      : $type = $type ?? 'initial';

  factory _$PHOTON_REQUEST_INITIALImpl.fromJson(Map<String, dynamic> json) =>
      _$$PHOTON_REQUEST_INITIALImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PhotonAdressState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PHOTON_REQUEST_INITIALImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PhotonAdressModel> datas) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PhotonAdressModel> datas)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PhotonAdressModel> datas)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PhotonAdressState value) $default, {
    required TResult Function(PHOTON_REQUEST_INITIAL value) initial,
    required TResult Function(PHOTON_REQUEST_LOADING value) loading,
    required TResult Function(PHOTON_REQUEST_SUCCESS value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PhotonAdressState value)? $default, {
    TResult? Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult? Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult? Function(PHOTON_REQUEST_SUCCESS value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PhotonAdressState value)? $default, {
    TResult Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult Function(PHOTON_REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PHOTON_REQUEST_INITIALImplToJson(
      this,
    );
  }
}

abstract class PHOTON_REQUEST_INITIAL implements PhotonAdressState {
  const factory PHOTON_REQUEST_INITIAL() = _$PHOTON_REQUEST_INITIALImpl;

  factory PHOTON_REQUEST_INITIAL.fromJson(Map<String, dynamic> json) =
      _$PHOTON_REQUEST_INITIALImpl.fromJson;
}

/// @nodoc
abstract class _$$PHOTON_REQUEST_LOADINGImplCopyWith<$Res> {
  factory _$$PHOTON_REQUEST_LOADINGImplCopyWith(
          _$PHOTON_REQUEST_LOADINGImpl value,
          $Res Function(_$PHOTON_REQUEST_LOADINGImpl) then) =
      __$$PHOTON_REQUEST_LOADINGImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PHOTON_REQUEST_LOADINGImplCopyWithImpl<$Res>
    extends _$PhotonAdressStateCopyWithImpl<$Res, _$PHOTON_REQUEST_LOADINGImpl>
    implements _$$PHOTON_REQUEST_LOADINGImplCopyWith<$Res> {
  __$$PHOTON_REQUEST_LOADINGImplCopyWithImpl(
      _$PHOTON_REQUEST_LOADINGImpl _value,
      $Res Function(_$PHOTON_REQUEST_LOADINGImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotonAdressState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PHOTON_REQUEST_LOADINGImpl implements PHOTON_REQUEST_LOADING {
  const _$PHOTON_REQUEST_LOADINGImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$PHOTON_REQUEST_LOADINGImpl.fromJson(Map<String, dynamic> json) =>
      _$$PHOTON_REQUEST_LOADINGImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PhotonAdressState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PHOTON_REQUEST_LOADINGImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PhotonAdressModel> datas) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PhotonAdressModel> datas)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PhotonAdressModel> datas)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PhotonAdressState value) $default, {
    required TResult Function(PHOTON_REQUEST_INITIAL value) initial,
    required TResult Function(PHOTON_REQUEST_LOADING value) loading,
    required TResult Function(PHOTON_REQUEST_SUCCESS value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PhotonAdressState value)? $default, {
    TResult? Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult? Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult? Function(PHOTON_REQUEST_SUCCESS value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PhotonAdressState value)? $default, {
    TResult Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult Function(PHOTON_REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PHOTON_REQUEST_LOADINGImplToJson(
      this,
    );
  }
}

abstract class PHOTON_REQUEST_LOADING implements PhotonAdressState {
  const factory PHOTON_REQUEST_LOADING() = _$PHOTON_REQUEST_LOADINGImpl;

  factory PHOTON_REQUEST_LOADING.fromJson(Map<String, dynamic> json) =
      _$PHOTON_REQUEST_LOADINGImpl.fromJson;
}

/// @nodoc
abstract class _$$PHOTON_REQUEST_SUCCESSImplCopyWith<$Res> {
  factory _$$PHOTON_REQUEST_SUCCESSImplCopyWith(
          _$PHOTON_REQUEST_SUCCESSImpl value,
          $Res Function(_$PHOTON_REQUEST_SUCCESSImpl) then) =
      __$$PHOTON_REQUEST_SUCCESSImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PhotonAdressModel> datas});
}

/// @nodoc
class __$$PHOTON_REQUEST_SUCCESSImplCopyWithImpl<$Res>
    extends _$PhotonAdressStateCopyWithImpl<$Res, _$PHOTON_REQUEST_SUCCESSImpl>
    implements _$$PHOTON_REQUEST_SUCCESSImplCopyWith<$Res> {
  __$$PHOTON_REQUEST_SUCCESSImplCopyWithImpl(
      _$PHOTON_REQUEST_SUCCESSImpl _value,
      $Res Function(_$PHOTON_REQUEST_SUCCESSImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotonAdressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datas = null,
  }) {
    return _then(_$PHOTON_REQUEST_SUCCESSImpl(
      null == datas
          ? _value._datas
          : datas // ignore: cast_nullable_to_non_nullable
              as List<PhotonAdressModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PHOTON_REQUEST_SUCCESSImpl implements PHOTON_REQUEST_SUCCESS {
  const _$PHOTON_REQUEST_SUCCESSImpl(final List<PhotonAdressModel> datas,
      {final String? $type})
      : _datas = datas,
        $type = $type ?? 'success';

  factory _$PHOTON_REQUEST_SUCCESSImpl.fromJson(Map<String, dynamic> json) =>
      _$$PHOTON_REQUEST_SUCCESSImplFromJson(json);

  final List<PhotonAdressModel> _datas;
  @override
  List<PhotonAdressModel> get datas {
    if (_datas is EqualUnmodifiableListView) return _datas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_datas);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PhotonAdressState.success(datas: $datas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PHOTON_REQUEST_SUCCESSImpl &&
            const DeepCollectionEquality().equals(other._datas, _datas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_datas));

  /// Create a copy of PhotonAdressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PHOTON_REQUEST_SUCCESSImplCopyWith<_$PHOTON_REQUEST_SUCCESSImpl>
      get copyWith => __$$PHOTON_REQUEST_SUCCESSImplCopyWithImpl<
          _$PHOTON_REQUEST_SUCCESSImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PhotonAdressModel> datas) success,
  }) {
    return success(datas);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PhotonAdressModel> datas)? success,
  }) {
    return success?.call(datas);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PhotonAdressModel> datas)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(datas);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PhotonAdressState value) $default, {
    required TResult Function(PHOTON_REQUEST_INITIAL value) initial,
    required TResult Function(PHOTON_REQUEST_LOADING value) loading,
    required TResult Function(PHOTON_REQUEST_SUCCESS value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PhotonAdressState value)? $default, {
    TResult? Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult? Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult? Function(PHOTON_REQUEST_SUCCESS value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PhotonAdressState value)? $default, {
    TResult Function(PHOTON_REQUEST_INITIAL value)? initial,
    TResult Function(PHOTON_REQUEST_LOADING value)? loading,
    TResult Function(PHOTON_REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PHOTON_REQUEST_SUCCESSImplToJson(
      this,
    );
  }
}

abstract class PHOTON_REQUEST_SUCCESS implements PhotonAdressState {
  const factory PHOTON_REQUEST_SUCCESS(final List<PhotonAdressModel> datas) =
      _$PHOTON_REQUEST_SUCCESSImpl;

  factory PHOTON_REQUEST_SUCCESS.fromJson(Map<String, dynamic> json) =
      _$PHOTON_REQUEST_SUCCESSImpl.fromJson;

  List<PhotonAdressModel> get datas;

  /// Create a copy of PhotonAdressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PHOTON_REQUEST_SUCCESSImplCopyWith<_$PHOTON_REQUEST_SUCCESSImpl>
      get copyWith => throw _privateConstructorUsedError;
}
