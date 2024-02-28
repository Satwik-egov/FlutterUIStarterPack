// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authbloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? username, String? password) login,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? username, String? password)? login,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? username, String? password)? login,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLoginEvent value) login,
    required TResult Function(_AuthLogoutEvent value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLoginEvent value)? login,
    TResult? Function(_AuthLogoutEvent value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLoginEvent value)? login,
    TResult Function(_AuthLogoutEvent value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthLoginEventImplCopyWith<$Res> {
  factory _$$AuthLoginEventImplCopyWith(_$AuthLoginEventImpl value,
          $Res Function(_$AuthLoginEventImpl) then) =
      __$$AuthLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? username, String? password});
}

/// @nodoc
class __$$AuthLoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLoginEventImpl>
    implements _$$AuthLoginEventImplCopyWith<$Res> {
  __$$AuthLoginEventImplCopyWithImpl(
      _$AuthLoginEventImpl _value, $Res Function(_$AuthLoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_$AuthLoginEventImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthLoginEventImpl implements _AuthLoginEvent {
  const _$AuthLoginEventImpl({this.username, this.password});

  @override
  final String? username;
  @override
  final String? password;

  @override
  String toString() {
    return 'AuthEvent.login(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginEventImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoginEventImplCopyWith<_$AuthLoginEventImpl> get copyWith =>
      __$$AuthLoginEventImplCopyWithImpl<_$AuthLoginEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? username, String? password) login,
    required TResult Function() logout,
  }) {
    return login(username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? username, String? password)? login,
    TResult? Function()? logout,
  }) {
    return login?.call(username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? username, String? password)? login,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLoginEvent value) login,
    required TResult Function(_AuthLogoutEvent value) logout,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLoginEvent value)? login,
    TResult? Function(_AuthLogoutEvent value)? logout,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLoginEvent value)? login,
    TResult Function(_AuthLogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _AuthLoginEvent implements AuthEvent {
  const factory _AuthLoginEvent(
      {final String? username, final String? password}) = _$AuthLoginEventImpl;

  String? get username;
  String? get password;
  @JsonKey(ignore: true)
  _$$AuthLoginEventImplCopyWith<_$AuthLoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLogoutEventImplCopyWith<$Res> {
  factory _$$AuthLogoutEventImplCopyWith(_$AuthLogoutEventImpl value,
          $Res Function(_$AuthLogoutEventImpl) then) =
      __$$AuthLogoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthLogoutEventImpl>
    implements _$$AuthLogoutEventImplCopyWith<$Res> {
  __$$AuthLogoutEventImplCopyWithImpl(
      _$AuthLogoutEventImpl _value, $Res Function(_$AuthLogoutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogoutEventImpl implements _AuthLogoutEvent {
  const _$AuthLogoutEventImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? username, String? password) login,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? username, String? password)? login,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? username, String? password)? login,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthLoginEvent value) login,
    required TResult Function(_AuthLogoutEvent value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthLoginEvent value)? login,
    TResult? Function(_AuthLogoutEvent value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthLoginEvent value)? login,
    TResult Function(_AuthLogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _AuthLogoutEvent implements AuthEvent {
  const factory _AuthLogoutEvent() = _$AuthLogoutEventImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() unauthenticated,
    required TResult Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)
        authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? unauthenticated,
    TResult? Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)?
        authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? unauthenticated,
    TResult Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)?
        authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorState value) error,
    required TResult Function(_UnauthenticatedState value) unauthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_UnauthenticatedState value)? unauthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorState value)? error,
    TResult Function(_UnauthenticatedState value)? unauthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl();

  @override
  String toString() {
    return 'AuthState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() unauthenticated,
    required TResult Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)
        authenticated,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? unauthenticated,
    TResult? Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)?
        authenticated,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? unauthenticated,
    TResult Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)?
        authenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorState value) error,
    required TResult Function(_UnauthenticatedState value) unauthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_UnauthenticatedState value)? unauthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorState value)? error,
    TResult Function(_UnauthenticatedState value)? unauthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements AuthState {
  const factory _ErrorState() = _$ErrorStateImpl;
}

/// @nodoc
abstract class _$$UnauthenticatedStateImplCopyWith<$Res> {
  factory _$$UnauthenticatedStateImplCopyWith(_$UnauthenticatedStateImpl value,
          $Res Function(_$UnauthenticatedStateImpl) then) =
      __$$UnauthenticatedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedStateImpl>
    implements _$$UnauthenticatedStateImplCopyWith<$Res> {
  __$$UnauthenticatedStateImplCopyWithImpl(_$UnauthenticatedStateImpl _value,
      $Res Function(_$UnauthenticatedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthenticatedStateImpl implements _UnauthenticatedState {
  const _$UnauthenticatedStateImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthenticatedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() unauthenticated,
    required TResult Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)
        authenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? unauthenticated,
    TResult? Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)?
        authenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? unauthenticated,
    TResult Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)?
        authenticated,
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
    required TResult Function(_ErrorState value) error,
    required TResult Function(_UnauthenticatedState value) unauthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_UnauthenticatedState value)? unauthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorState value)? error,
    TResult Function(_UnauthenticatedState value)? unauthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnauthenticatedState implements AuthState {
  const factory _UnauthenticatedState() = _$UnauthenticatedStateImpl;
}

/// @nodoc
abstract class _$$AuthenticatedStateImplCopyWith<$Res> {
  factory _$$AuthenticatedStateImplCopyWith(_$AuthenticatedStateImpl value,
          $Res Function(_$AuthenticatedStateImpl) then) =
      __$$AuthenticatedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String accesstoken, String? refreshtoken, UserRequest? userRequest});

  $UserRequestCopyWith<$Res>? get userRequest;
}

/// @nodoc
class __$$AuthenticatedStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedStateImpl>
    implements _$$AuthenticatedStateImplCopyWith<$Res> {
  __$$AuthenticatedStateImplCopyWithImpl(_$AuthenticatedStateImpl _value,
      $Res Function(_$AuthenticatedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accesstoken = null,
    Object? refreshtoken = freezed,
    Object? userRequest = freezed,
  }) {
    return _then(_$AuthenticatedStateImpl(
      accesstoken: null == accesstoken
          ? _value.accesstoken
          : accesstoken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshtoken: freezed == refreshtoken
          ? _value.refreshtoken
          : refreshtoken // ignore: cast_nullable_to_non_nullable
              as String?,
      userRequest: freezed == userRequest
          ? _value.userRequest
          : userRequest // ignore: cast_nullable_to_non_nullable
              as UserRequest?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRequestCopyWith<$Res>? get userRequest {
    if (_value.userRequest == null) {
      return null;
    }

    return $UserRequestCopyWith<$Res>(_value.userRequest!, (value) {
      return _then(_value.copyWith(userRequest: value));
    });
  }
}

/// @nodoc

class _$AuthenticatedStateImpl implements _AuthenticatedState {
  const _$AuthenticatedStateImpl(
      {required this.accesstoken,
      required this.refreshtoken,
      required this.userRequest});

  @override
  final String accesstoken;
  @override
  final String? refreshtoken;
  @override
  final UserRequest? userRequest;

  @override
  String toString() {
    return 'AuthState.authenticated(accesstoken: $accesstoken, refreshtoken: $refreshtoken, userRequest: $userRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedStateImpl &&
            (identical(other.accesstoken, accesstoken) ||
                other.accesstoken == accesstoken) &&
            (identical(other.refreshtoken, refreshtoken) ||
                other.refreshtoken == refreshtoken) &&
            (identical(other.userRequest, userRequest) ||
                other.userRequest == userRequest));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accesstoken, refreshtoken, userRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedStateImplCopyWith<_$AuthenticatedStateImpl> get copyWith =>
      __$$AuthenticatedStateImplCopyWithImpl<_$AuthenticatedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() unauthenticated,
    required TResult Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)
        authenticated,
  }) {
    return authenticated(accesstoken, refreshtoken, userRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? unauthenticated,
    TResult? Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)?
        authenticated,
  }) {
    return authenticated?.call(accesstoken, refreshtoken, userRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? unauthenticated,
    TResult Function(
            String accesstoken, String? refreshtoken, UserRequest? userRequest)?
        authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(accesstoken, refreshtoken, userRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorState value) error,
    required TResult Function(_UnauthenticatedState value) unauthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_UnauthenticatedState value)? unauthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorState value)? error,
    TResult Function(_UnauthenticatedState value)? unauthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedState implements AuthState {
  const factory _AuthenticatedState(
      {required final String accesstoken,
      required final String? refreshtoken,
      required final UserRequest? userRequest}) = _$AuthenticatedStateImpl;

  String get accesstoken;
  String? get refreshtoken;
  UserRequest? get userRequest;
  @JsonKey(ignore: true)
  _$$AuthenticatedStateImplCopyWith<_$AuthenticatedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
