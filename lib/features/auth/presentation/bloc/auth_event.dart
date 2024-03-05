part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent{
  final LoginRequest data;
  LoginEvent({required this.data});
}

class SignupEvent extends AuthEvent{
  final SignupParams data;
  SignupEvent({required this.data});
}




