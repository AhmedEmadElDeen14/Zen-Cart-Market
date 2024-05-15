part of 'log_in_bloc.dart';

@immutable
 class LoginState {
  RequestStatus? status;
  UserModel? userModel;
  Failures? failures;

  LoginState({this.status, this.userModel, this.failures});

  LoginState copyWith(
      {RequestStatus? status,
        UserModel? userModel,
        Failures? failures}) {
    return LoginState(
        status: status ?? this.status,
        failures: failures ?? this.failures,
        userModel: userModel ?? this.userModel);
  }
}

final class LoginInitial extends LoginState {}
