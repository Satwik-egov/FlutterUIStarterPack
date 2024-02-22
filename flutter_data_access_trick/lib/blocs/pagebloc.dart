import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagebloc.freezed.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(const PageState.unauthenticated()) {
    on<_PageLoginEvent>(_onLogin);
  }

  void _onLogin(_PageLoginEvent event, Emitter<PageState> emit) {
    emit(PageState.authenticated(name: event.name, password: event.password));
  }
}

@freezed
class PageEvent with _$PageEvent {
  const factory PageEvent.login(
      {required String name, required String password}) = _PageLoginEvent;
}

@freezed
class PageState with _$PageState {
  const factory PageState.unauthenticated() = _UnauthState;
  const factory PageState.authenticated(
      {required String name, required String password}) = _AuthState;
}
