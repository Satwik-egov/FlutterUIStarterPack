import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/model/login/loginModel.dart';
import 'package:new_digit_app/model/response/responsemodel.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';
import 'package:new_digit_app/repositories/authRepo.dart';

part 'authbloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late String _accesstoken;
  late UserRequest _userRequest;
  late String _refreshtoken;
  final authRepository = AuthRepository();

  AuthBloc() : super(AuthState.unauthenticated()) {
    on<_AuthLoginEvent>(_onLogin);
    on<_AuthLogoutEvent>(_onLogout);
  }

  FutureOr<void> _onLogin(
      _AuthLoginEvent event, Emitter<AuthState> emit) async {
    try {
      // final bool isValid = await authRepository.validateLogin(LoginModel(
      final response = await authRepository.validateLogin(LoginModel(
        username: event.username,
        password: event.password,
        // tenantId: 'mz',
        tenantId: envConfig.variables.tenantId,
        grant_type: 'password',
        userType: 'EMPLOYEE',
      ));

      _accesstoken = response.access_token;
      _refreshtoken = response.refresh_token!;
      _userRequest = response.userRequest!;

      emit(AuthState.authenticated(
          access_token: _accesstoken,
          refresh_token: _refreshtoken,
          userRequest: _userRequest));
    } catch (err) {
      emit(const AuthState.error());
      print(err);
    }
  }

  FutureOr<void> _onLogout(_AuthLogoutEvent event, Emitter<AuthState> emit) {
    emit(const AuthState.unauthenticated());
  }
}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    String? username,
    String? password,
  }) = _AuthLoginEvent;
  const factory AuthEvent.logout() = _AuthLogoutEvent;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.error() = _ErrorState;
  const factory AuthState.unauthenticated() = _UnauthenticatedState;
  const factory AuthState.authenticated({
    required String access_token,
    required String? refresh_token,
    required UserRequest? userRequest,
  }) = _AuthenticatedState;
}
