part of 'log_in_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginButtonEvent extends LoginEvent{
  String email;
  String password;

  LoginButtonEvent(this.email, this.password);
}