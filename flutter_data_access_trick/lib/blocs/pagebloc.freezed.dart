// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagebloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageEvent {
  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String password) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String password)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageLoginEvent value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageLoginEvent value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageLoginEvent value)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageEventCopyWith<PageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageEventCopyWith<$Res> {
  factory $PageEventCopyWith(PageEvent value, $Res Function(PageEvent) then) =
      _$PageEventCopyWithImpl<$Res, PageEvent>;
  @useResult
  $Res call({String name, String password});
}

/// @nodoc
class _$PageEventCopyWithImpl<$Res, $Val extends PageEvent>
    implements $PageEventCopyWith<$Res> {
  _$PageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageLoginEventImplCopyWith<$Res>
    implements $PageEventCopyWith<$Res> {
  factory _$$PageLoginEventImplCopyWith(_$PageLoginEventImpl value,
          $Res Function(_$PageLoginEventImpl) then) =
      __$$PageLoginEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String password});
}

/// @nodoc
class __$$PageLoginEventImplCopyWithImpl<$Res>
    extends _$PageEventCopyWithImpl<$Res, _$PageLoginEventImpl>
    implements _$$PageLoginEventImplCopyWith<$Res> {
  __$$PageLoginEventImplCopyWithImpl(
      _$PageLoginEventImpl _value, $Res Function(_$PageLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_$PageLoginEventImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PageLoginEventImpl implements _PageLoginEvent {
  const _$PageLoginEventImpl({required this.name, required this.password});

  @override
  final String name;
  @override
  final String password;

  @override
  String toString() {
    return 'PageEvent.login(name: $name, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageLoginEventImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageLoginEventImplCopyWith<_$PageLoginEventImpl> get copyWith =>
      __$$PageLoginEventImplCopyWithImpl<_$PageLoginEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String password) login,
  }) {
    return login(name, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String password)? login,
  }) {
    return login?.call(name, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String password)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(name, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageLoginEvent value) login,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageLoginEvent value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageLoginEvent value)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _PageLoginEvent implements PageEvent {
  const factory _PageLoginEvent(
      {required final String name,
      required final String password}) = _$PageLoginEventImpl;

  @override
  String get name;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$PageLoginEventImplCopyWith<_$PageLoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String name, String password) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String name, String password)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String name, String password)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnauthState value) unauthenticated,
    required TResult Function(_AuthState value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnauthState value)? unauthenticated,
    TResult? Function(_AuthState value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnauthState value)? unauthenticated,
    TResult Function(_AuthState value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageStateCopyWith<$Res> {
  factory $PageStateCopyWith(PageState value, $Res Function(PageState) then) =
      _$PageStateCopyWithImpl<$Res, PageState>;
}

/// @nodoc
class _$PageStateCopyWithImpl<$Res, $Val extends PageState>
    implements $PageStateCopyWith<$Res> {
  _$PageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnauthStateImplCopyWith<$Res> {
  factory _$$UnauthStateImplCopyWith(
          _$UnauthStateImpl value, $Res Function(_$UnauthStateImpl) then) =
      __$$UnauthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthStateImplCopyWithImpl<$Res>
    extends _$PageStateCopyWithImpl<$Res, _$UnauthStateImpl>
    implements _$$UnauthStateImplCopyWith<$Res> {
  __$$UnauthStateImplCopyWithImpl(
      _$UnauthStateImpl _value, $Res Function(_$UnauthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthStateImpl implements _UnauthState {
  const _$UnauthStateImpl();

  @override
  String toString() {
    return 'PageState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String name, String password) authenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String name, String password)? authenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String name, String password)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnauthState value) unauthenticated,
    required TResult Function(_AuthState value) authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnauthState value)? unauthenticated,
    TResult? Function(_AuthState value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnauthState value)? unauthenticated,
    TResult Function(_AuthState value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnauthState implements PageState {
  const factory _UnauthState() = _$UnauthStateImpl;
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String password});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$PageStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_$AuthStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({required this.name, required this.password});

  @override
  final String name;
  @override
  final String password;

  @override
  String toString() {
    return 'PageState.authenticated(name: $name, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(String name, String password) authenticated,
  }) {
    return authenticated(name, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthenticated,
    TResult? Function(String name, String password)? authenticated,
  }) {
    return authenticated?.call(name, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(String name, String password)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(name, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnauthState value) unauthenticated,
    required TResult Function(_AuthState value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnauthState value)? unauthenticated,
    TResult? Function(_AuthState value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnauthState value)? unauthenticated,
    TResult Function(_AuthState value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthState implements PageState {
  const factory _AuthState(
      {required final String name,
      required final String password}) = _$AuthStateImpl;

  String get name;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
