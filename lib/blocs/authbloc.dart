import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/model/login/loginModel.dart';
import 'package:new_digit_app/repositories/authRepo.dart';

part 'authbloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late String _accesstoken;
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
        tenantId: 'mz',
        grant_type: 'password',
        userType: 'EMPLOYEE',
      ));

      _accesstoken = response.access_token;
      emit(AuthState.authenticated());

      //take tenantID from an envConfig file you create later

      // if (isValid)
      //   emit(AuthState.authenticated());
      // else {
      //   emit(AuthState.error());
      // }
    } catch (err) {
      emit(AuthState.error());
      print(err);
    }
  }

  FutureOr<void> _onLogout(_AuthLogoutEvent event, Emitter<AuthState> emit) {
    emit(AuthState.unauthenticated());
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
  const factory AuthState.authenticated() = _AuthenticatedState;
}
