part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}


class AuthErrorState extends AuthState {
  final String message;
   AuthErrorState({required this.message});
}

@immutable
class AuthSuccessState extends AuthState {
  AuthSuccessState();

}


