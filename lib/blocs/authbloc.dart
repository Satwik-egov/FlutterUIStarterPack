import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/dataModel.dart';
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

  AuthBloc() : super(const AuthState.unauthenticated()) {
    on<_AuthLoginEvent>(_onLogin);
    on<_AuthLogoutEvent>(_onLogout);
  }

  FutureOr<void> _onLogin(
      _AuthLoginEvent event, Emitter<AuthState> emit) async {
    ResponseModel response;
    final secureStore = SecureStore();
    //Send a login request and retrieve the access_token for further requests
    try {
      final loginUrl =
          event.actionMap?[DataModelType.user]?[ApiOperation.login];

      response = await authRepository.validateLogin(
          loginUrl!,
          LoginModel(
            username: event.username,
            password: event.password,
            tenantId: envConfig.variables.tenantId,
            grant_type: 'password',
            userType: 'EMPLOYEE',
          ));

      _accesstoken = response.access_token;
      _refreshtoken = response.refresh_token!;
      _userRequest = response.userRequest!;

      //store accessToken in secure storage
      secureStore.setAccessToken(_accesstoken);

      emit(AuthState.authenticated(
          accesstoken: _accesstoken,
          refreshtoken: _refreshtoken,
          userRequest: _userRequest));

      final actionsWrapper = await authRepository.searchRoleActions({
        "roleCodes": response.userRequest?.roles.map((e) => e.code).toList(),
        "tenantId": envConfig.variables.tenantId,
        "actionMaster": "actions-test",
        "enabled": true,
      });

      await secureStore.setRoleActions(actionsWrapper);
    } catch (err) {
      rethrow;
    }
  }

  FutureOr<void> _onLogout(_AuthLogoutEvent event, Emitter<AuthState> emit) {
    emit(const AuthState.unauthenticated());
  }
}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
          {String? username,
          String? password,
          Map<DataModelType, Map<ApiOperation, String>>? actionMap}) =
      _AuthLoginEvent;
  const factory AuthEvent.logout() = _AuthLogoutEvent;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.error() = _ErrorState;
  const factory AuthState.unauthenticated() = _UnauthenticatedState;
  const factory AuthState.authenticated({
    required String accesstoken,
    required String? refreshtoken,
    required UserRequest? userRequest,
  }) = _AuthenticatedState;
}
