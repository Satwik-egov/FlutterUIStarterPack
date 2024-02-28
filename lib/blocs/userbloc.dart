import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import 'package:new_digit_app/repositories/user_repository.dart';

part 'userbloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.empty()) {
    on(_handleSearchUser);
    // on(_handleUpdateUser);
  }

  FutureOr<void> _handleSearchUser(
      UserEvent event, Emitter<UserState> emit) async {
    try {
      final response = await UserRepository().searchUser(event.uuid);
      print(response);

      emit(UserState.user(userModel: response));
    } catch (err) {
      emit(UserState.error());
      rethrow;
    }
  }

  // FutureOr<void> _handleUpdateUser(UserEvent event, Emitter<UserState> emit) {}
}

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.searchUser({required String uuid}) = _UserSearchEvent;
  // const factory UserEvent.updateUser(
  //     {required UserModel user, required UserModel olduser}) = _UserUpdateEvent;
}

@freezed
class UserState with _$UserState {
  const factory UserState.empty() = _UserEmptyState;
  const factory UserState.loading() = _UserLoadingState;
  const factory UserState.user({UserModel? userModel}) = _UserUserState;
  const factory UserState.error([String? error]) = _UserErrorState;
}
