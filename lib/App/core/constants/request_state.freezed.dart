// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestState _$RequestStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _RequestState.fromJson(json);
    case 'initial':
      return REQUEST_INITIAL.fromJson(json);
    case 'loading':
      return REQUEST_LOADING.fromJson(json);
    case 'success':
      return REQUEST_SUCCESS.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RequestState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RequestState value) $default, {
    required TResult Function(REQUEST_INITIAL value) initial,
    required TResult Function(REQUEST_LOADING value) loading,
    required TResult Function(REQUEST_SUCCESS value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RequestState value)? $default, {
    TResult? Function(REQUEST_INITIAL value)? initial,
    TResult? Function(REQUEST_LOADING value)? loading,
    TResult? Function(REQUEST_SUCCESS value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RequestState value)? $default, {
    TResult Function(REQUEST_INITIAL value)? initial,
    TResult Function(REQUEST_LOADING value)? loading,
    TResult Function(REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this RequestState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<$Res> {
  factory $RequestStateCopyWith(
          RequestState value, $Res Function(RequestState) then) =
      _$RequestStateCopyWithImpl<$Res, RequestState>;
}

/// @nodoc
class _$RequestStateCopyWithImpl<$Res, $Val extends RequestState>
    implements $RequestStateCopyWith<$Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RequestStateImplCopyWith<$Res> {
  factory _$$RequestStateImplCopyWith(
          _$RequestStateImpl value, $Res Function(_$RequestStateImpl) then) =
      __$$RequestStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestStateImplCopyWithImpl<$Res>
    extends _$RequestStateCopyWithImpl<$Res, _$RequestStateImpl>
    implements _$$RequestStateImplCopyWith<$Res> {
  __$$RequestStateImplCopyWithImpl(
      _$RequestStateImpl _value, $Res Function(_$RequestStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$RequestStateImpl implements _RequestState {
  _$RequestStateImpl({final String? $type}) : $type = $type ?? 'default';

  factory _$RequestStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestStateImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RequestState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestStateImpl);
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
    required TResult Function() success,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    TResult Function(_RequestState value) $default, {
    required TResult Function(REQUEST_INITIAL value) initial,
    required TResult Function(REQUEST_LOADING value) loading,
    required TResult Function(REQUEST_SUCCESS value) success,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RequestState value)? $default, {
    TResult? Function(REQUEST_INITIAL value)? initial,
    TResult? Function(REQUEST_LOADING value)? loading,
    TResult? Function(REQUEST_SUCCESS value)? success,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RequestState value)? $default, {
    TResult Function(REQUEST_INITIAL value)? initial,
    TResult Function(REQUEST_LOADING value)? loading,
    TResult Function(REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestStateImplToJson(
      this,
    );
  }
}

abstract class _RequestState implements RequestState {
  factory _RequestState() = _$RequestStateImpl;

  factory _RequestState.fromJson(Map<String, dynamic> json) =
      _$RequestStateImpl.fromJson;
}

/// @nodoc
abstract class _$$REQUEST_INITIALImplCopyWith<$Res> {
  factory _$$REQUEST_INITIALImplCopyWith(_$REQUEST_INITIALImpl value,
          $Res Function(_$REQUEST_INITIALImpl) then) =
      __$$REQUEST_INITIALImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$REQUEST_INITIALImplCopyWithImpl<$Res>
    extends _$RequestStateCopyWithImpl<$Res, _$REQUEST_INITIALImpl>
    implements _$$REQUEST_INITIALImplCopyWith<$Res> {
  __$$REQUEST_INITIALImplCopyWithImpl(
      _$REQUEST_INITIALImpl _value, $Res Function(_$REQUEST_INITIALImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$REQUEST_INITIALImpl implements REQUEST_INITIAL {
  const _$REQUEST_INITIALImpl({final String? $type})
      : $type = $type ?? 'initial';

  factory _$REQUEST_INITIALImpl.fromJson(Map<String, dynamic> json) =>
      _$$REQUEST_INITIALImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RequestState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$REQUEST_INITIALImpl);
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
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    TResult Function(_RequestState value) $default, {
    required TResult Function(REQUEST_INITIAL value) initial,
    required TResult Function(REQUEST_LOADING value) loading,
    required TResult Function(REQUEST_SUCCESS value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RequestState value)? $default, {
    TResult? Function(REQUEST_INITIAL value)? initial,
    TResult? Function(REQUEST_LOADING value)? loading,
    TResult? Function(REQUEST_SUCCESS value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RequestState value)? $default, {
    TResult Function(REQUEST_INITIAL value)? initial,
    TResult Function(REQUEST_LOADING value)? loading,
    TResult Function(REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$REQUEST_INITIALImplToJson(
      this,
    );
  }
}

abstract class REQUEST_INITIAL implements RequestState {
  const factory REQUEST_INITIAL() = _$REQUEST_INITIALImpl;

  factory REQUEST_INITIAL.fromJson(Map<String, dynamic> json) =
      _$REQUEST_INITIALImpl.fromJson;
}

/// @nodoc
abstract class _$$REQUEST_LOADINGImplCopyWith<$Res> {
  factory _$$REQUEST_LOADINGImplCopyWith(_$REQUEST_LOADINGImpl value,
          $Res Function(_$REQUEST_LOADINGImpl) then) =
      __$$REQUEST_LOADINGImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$REQUEST_LOADINGImplCopyWithImpl<$Res>
    extends _$RequestStateCopyWithImpl<$Res, _$REQUEST_LOADINGImpl>
    implements _$$REQUEST_LOADINGImplCopyWith<$Res> {
  __$$REQUEST_LOADINGImplCopyWithImpl(
      _$REQUEST_LOADINGImpl _value, $Res Function(_$REQUEST_LOADINGImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$REQUEST_LOADINGImpl implements REQUEST_LOADING {
  const _$REQUEST_LOADINGImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$REQUEST_LOADINGImpl.fromJson(Map<String, dynamic> json) =>
      _$$REQUEST_LOADINGImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RequestState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$REQUEST_LOADINGImpl);
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
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    TResult Function(_RequestState value) $default, {
    required TResult Function(REQUEST_INITIAL value) initial,
    required TResult Function(REQUEST_LOADING value) loading,
    required TResult Function(REQUEST_SUCCESS value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RequestState value)? $default, {
    TResult? Function(REQUEST_INITIAL value)? initial,
    TResult? Function(REQUEST_LOADING value)? loading,
    TResult? Function(REQUEST_SUCCESS value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RequestState value)? $default, {
    TResult Function(REQUEST_INITIAL value)? initial,
    TResult Function(REQUEST_LOADING value)? loading,
    TResult Function(REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$REQUEST_LOADINGImplToJson(
      this,
    );
  }
}

abstract class REQUEST_LOADING implements RequestState {
  const factory REQUEST_LOADING() = _$REQUEST_LOADINGImpl;

  factory REQUEST_LOADING.fromJson(Map<String, dynamic> json) =
      _$REQUEST_LOADINGImpl.fromJson;
}

/// @nodoc
abstract class _$$REQUEST_SUCCESSImplCopyWith<$Res> {
  factory _$$REQUEST_SUCCESSImplCopyWith(_$REQUEST_SUCCESSImpl value,
          $Res Function(_$REQUEST_SUCCESSImpl) then) =
      __$$REQUEST_SUCCESSImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$REQUEST_SUCCESSImplCopyWithImpl<$Res>
    extends _$RequestStateCopyWithImpl<$Res, _$REQUEST_SUCCESSImpl>
    implements _$$REQUEST_SUCCESSImplCopyWith<$Res> {
  __$$REQUEST_SUCCESSImplCopyWithImpl(
      _$REQUEST_SUCCESSImpl _value, $Res Function(_$REQUEST_SUCCESSImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$REQUEST_SUCCESSImpl implements REQUEST_SUCCESS {
  const _$REQUEST_SUCCESSImpl({final String? $type})
      : $type = $type ?? 'success';

  factory _$REQUEST_SUCCESSImpl.fromJson(Map<String, dynamic> json) =>
      _$$REQUEST_SUCCESSImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RequestState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$REQUEST_SUCCESSImpl);
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
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RequestState value) $default, {
    required TResult Function(REQUEST_INITIAL value) initial,
    required TResult Function(REQUEST_LOADING value) loading,
    required TResult Function(REQUEST_SUCCESS value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RequestState value)? $default, {
    TResult? Function(REQUEST_INITIAL value)? initial,
    TResult? Function(REQUEST_LOADING value)? loading,
    TResult? Function(REQUEST_SUCCESS value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RequestState value)? $default, {
    TResult Function(REQUEST_INITIAL value)? initial,
    TResult Function(REQUEST_LOADING value)? loading,
    TResult Function(REQUEST_SUCCESS value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$REQUEST_SUCCESSImplToJson(
      this,
    );
  }
}

abstract class REQUEST_SUCCESS implements RequestState {
  const factory REQUEST_SUCCESS() = _$REQUEST_SUCCESSImpl;

  factory REQUEST_SUCCESS.fromJson(Map<String, dynamic> json) =
      _$REQUEST_SUCCESSImpl.fromJson;
}
