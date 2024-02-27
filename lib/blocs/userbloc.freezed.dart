// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userbloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) searchUser,
    required TResult Function(UserModel user, UserModel olduser) updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? searchUser,
    TResult? Function(UserModel user, UserModel olduser)? updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? searchUser,
    TResult Function(UserModel user, UserModel olduser)? updateUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserSearchEvent value) searchUser,
    required TResult Function(_UserUpdateEvent value) updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserSearchEvent value)? searchUser,
    TResult? Function(_UserUpdateEvent value)? updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserSearchEvent value)? searchUser,
    TResult Function(_UserUpdateEvent value)? updateUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserSearchEventImplCopyWith<$Res> {
  factory _$$UserSearchEventImplCopyWith(_$UserSearchEventImpl value,
          $Res Function(_$UserSearchEventImpl) then) =
      __$$UserSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$UserSearchEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserSearchEventImpl>
    implements _$$UserSearchEventImplCopyWith<$Res> {
  __$$UserSearchEventImplCopyWithImpl(
      _$UserSearchEventImpl _value, $Res Function(_$UserSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$UserSearchEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserSearchEventImpl implements _UserSearchEvent {
  const _$UserSearchEventImpl({required this.uuid});

  @override
  final String uuid;

  @override
  String toString() {
    return 'UserEvent.searchUser(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchEventImplCopyWith<_$UserSearchEventImpl> get copyWith =>
      __$$UserSearchEventImplCopyWithImpl<_$UserSearchEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) searchUser,
    required TResult Function(UserModel user, UserModel olduser) updateUser,
  }) {
    return searchUser(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? searchUser,
    TResult? Function(UserModel user, UserModel olduser)? updateUser,
  }) {
    return searchUser?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? searchUser,
    TResult Function(UserModel user, UserModel olduser)? updateUser,
    required TResult orElse(),
  }) {
    if (searchUser != null) {
      return searchUser(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserSearchEvent value) searchUser,
    required TResult Function(_UserUpdateEvent value) updateUser,
  }) {
    return searchUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserSearchEvent value)? searchUser,
    TResult? Function(_UserUpdateEvent value)? updateUser,
  }) {
    return searchUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserSearchEvent value)? searchUser,
    TResult Function(_UserUpdateEvent value)? updateUser,
    required TResult orElse(),
  }) {
    if (searchUser != null) {
      return searchUser(this);
    }
    return orElse();
  }
}

abstract class _UserSearchEvent implements UserEvent {
  const factory _UserSearchEvent({required final String uuid}) =
      _$UserSearchEventImpl;

  String get uuid;
  @JsonKey(ignore: true)
  _$$UserSearchEventImplCopyWith<_$UserSearchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserUpdateEventImplCopyWith<$Res> {
  factory _$$UserUpdateEventImplCopyWith(_$UserUpdateEventImpl value,
          $Res Function(_$UserUpdateEventImpl) then) =
      __$$UserUpdateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user, UserModel olduser});
}

/// @nodoc
class __$$UserUpdateEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserUpdateEventImpl>
    implements _$$UserUpdateEventImplCopyWith<$Res> {
  __$$UserUpdateEventImplCopyWithImpl(
      _$UserUpdateEventImpl _value, $Res Function(_$UserUpdateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? olduser = null,
  }) {
    return _then(_$UserUpdateEventImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      olduser: null == olduser
          ? _value.olduser
          : olduser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$UserUpdateEventImpl implements _UserUpdateEvent {
  const _$UserUpdateEventImpl({required this.user, required this.olduser});

  @override
  final UserModel user;
  @override
  final UserModel olduser;

  @override
  String toString() {
    return 'UserEvent.updateUser(user: $user, olduser: $olduser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateEventImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.olduser, olduser) || other.olduser == olduser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, olduser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdateEventImplCopyWith<_$UserUpdateEventImpl> get copyWith =>
      __$$UserUpdateEventImplCopyWithImpl<_$UserUpdateEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) searchUser,
    required TResult Function(UserModel user, UserModel olduser) updateUser,
  }) {
    return updateUser(user, olduser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? searchUser,
    TResult? Function(UserModel user, UserModel olduser)? updateUser,
  }) {
    return updateUser?.call(user, olduser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? searchUser,
    TResult Function(UserModel user, UserModel olduser)? updateUser,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(user, olduser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserSearchEvent value) searchUser,
    required TResult Function(_UserUpdateEvent value) updateUser,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserSearchEvent value)? searchUser,
    TResult? Function(_UserUpdateEvent value)? updateUser,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserSearchEvent value)? searchUser,
    TResult Function(_UserUpdateEvent value)? updateUser,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class _UserUpdateEvent implements UserEvent {
  const factory _UserUpdateEvent(
      {required final UserModel user,
      required final UserModel olduser}) = _$UserUpdateEventImpl;

  UserModel get user;
  UserModel get olduser;
  @JsonKey(ignore: true)
  _$$UserUpdateEventImplCopyWith<_$UserUpdateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserEmptyState value) empty,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserUserState value) user,
    required TResult Function(_UserErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserEmptyState value)? empty,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserUserState value)? user,
    TResult? Function(_UserErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserEmptyState value)? empty,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserUserState value)? user,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserEmptyStateImplCopyWith<$Res> {
  factory _$$UserEmptyStateImplCopyWith(_$UserEmptyStateImpl value,
          $Res Function(_$UserEmptyStateImpl) then) =
      __$$UserEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserEmptyStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserEmptyStateImpl>
    implements _$$UserEmptyStateImplCopyWith<$Res> {
  __$$UserEmptyStateImplCopyWithImpl(
      _$UserEmptyStateImpl _value, $Res Function(_$UserEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserEmptyStateImpl implements _UserEmptyState {
  const _$UserEmptyStateImpl();

  @override
  String toString() {
    return 'UserState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserEmptyState value) empty,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserUserState value) user,
    required TResult Function(_UserErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserEmptyState value)? empty,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserUserState value)? user,
    TResult? Function(_UserErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserEmptyState value)? empty,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserUserState value)? user,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _UserEmptyState implements UserState {
  const factory _UserEmptyState() = _$UserEmptyStateImpl;
}

/// @nodoc
abstract class _$$UserLoadingStateImplCopyWith<$Res> {
  factory _$$UserLoadingStateImplCopyWith(_$UserLoadingStateImpl value,
          $Res Function(_$UserLoadingStateImpl) then) =
      __$$UserLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoadingStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserLoadingStateImpl>
    implements _$$UserLoadingStateImplCopyWith<$Res> {
  __$$UserLoadingStateImplCopyWithImpl(_$UserLoadingStateImpl _value,
      $Res Function(_$UserLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserLoadingStateImpl implements _UserLoadingState {
  const _$UserLoadingStateImpl();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserEmptyState value) empty,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserUserState value) user,
    required TResult Function(_UserErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserEmptyState value)? empty,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserUserState value)? user,
    TResult? Function(_UserErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserEmptyState value)? empty,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserUserState value)? user,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UserLoadingState implements UserState {
  const factory _UserLoadingState() = _$UserLoadingStateImpl;
}

/// @nodoc
abstract class _$$UserUserStateImplCopyWith<$Res> {
  factory _$$UserUserStateImplCopyWith(
          _$UserUserStateImpl value, $Res Function(_$UserUserStateImpl) then) =
      __$$UserUserStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel? userModel});
}

/// @nodoc
class __$$UserUserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserUserStateImpl>
    implements _$$UserUserStateImplCopyWith<$Res> {
  __$$UserUserStateImplCopyWithImpl(
      _$UserUserStateImpl _value, $Res Function(_$UserUserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userModel = freezed,
  }) {
    return _then(_$UserUserStateImpl(
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$UserUserStateImpl implements _UserUserState {
  const _$UserUserStateImpl({this.userModel});

  @override
  final UserModel? userModel;

  @override
  String toString() {
    return 'UserState.user(userModel: $userModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUserStateImpl &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUserStateImplCopyWith<_$UserUserStateImpl> get copyWith =>
      __$$UserUserStateImplCopyWithImpl<_$UserUserStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) {
    return user(userModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) {
    return user?.call(userModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(userModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserEmptyState value) empty,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserUserState value) user,
    required TResult Function(_UserErrorState value) error,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserEmptyState value)? empty,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserUserState value)? user,
    TResult? Function(_UserErrorState value)? error,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserEmptyState value)? empty,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserUserState value)? user,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }
}

abstract class _UserUserState implements UserState {
  const factory _UserUserState({final UserModel? userModel}) =
      _$UserUserStateImpl;

  UserModel? get userModel;
  @JsonKey(ignore: true)
  _$$UserUserStateImplCopyWith<_$UserUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserErrorStateImplCopyWith<$Res> {
  factory _$$UserErrorStateImplCopyWith(_$UserErrorStateImpl value,
          $Res Function(_$UserErrorStateImpl) then) =
      __$$UserErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$UserErrorStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserErrorStateImpl>
    implements _$$UserErrorStateImplCopyWith<$Res> {
  __$$UserErrorStateImplCopyWithImpl(
      _$UserErrorStateImpl _value, $Res Function(_$UserErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$UserErrorStateImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserErrorStateImpl implements _UserErrorState {
  const _$UserErrorStateImpl([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'UserState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserErrorStateImplCopyWith<_$UserErrorStateImpl> get copyWith =>
      __$$UserErrorStateImplCopyWithImpl<_$UserErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel? userModel) user,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel? userModel)? user,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel? userModel)? user,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserEmptyState value) empty,
    required TResult Function(_UserLoadingState value) loading,
    required TResult Function(_UserUserState value) user,
    required TResult Function(_UserErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserEmptyState value)? empty,
    TResult? Function(_UserLoadingState value)? loading,
    TResult? Function(_UserUserState value)? user,
    TResult? Function(_UserErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserEmptyState value)? empty,
    TResult Function(_UserLoadingState value)? loading,
    TResult Function(_UserUserState value)? user,
    TResult Function(_UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UserErrorState implements UserState {
  const factory _UserErrorState([final String? error]) = _$UserErrorStateImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$UserErrorStateImplCopyWith<_$UserErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
