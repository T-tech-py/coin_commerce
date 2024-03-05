import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/login_request.dart';
import '../../domain/usecase/login_use_case.dart';
import '../../domain/usecase/signup_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final SignupUseCase _signupUseCase;

  AuthBloc(this._loginUseCase, this._signupUseCase,

      )
      : super(AuthInitial()) {
    on<LoginEvent>(_loginEvent);
    on<SignupEvent>(_studentSignupEvent);
  }

  Future<void> _loginEvent(LoginEvent event,
      Emitter<AuthState> emit,) async {
    emit(
      AuthLoadingState(),
    );
    await _loginUseCase(event.data).then(
          (value) =>
          value.fold(
                (failure) =>
                emit(
                  AuthErrorState(message: failure.message),
                ), (success) =>
              emit(
                AuthSuccessState(),
              ),
          ),
    );
  }

  Future<void> _studentSignupEvent(SignupEvent event,
      Emitter<AuthState> emit,) async {
    emit(
      AuthLoadingState(),
    );
    await _signupUseCase(event.data).then(
          (value) =>
          value.fold(
                (failure) =>
                emit(
                  AuthErrorState(message: failure.message),
                ), (success) =>
              emit(
                AuthSuccessState(
                ),
              ),
          ),
    );
  }
}