part of 'sign_up_bloc.dart';

@immutable
class SignUpState {
  RequestStatus? status;
  SignUpModel? model;
  Failures? failures;

  SignUpState({this.status, this.model, this.failures});

  SignUpState copyWith(
      {RequestStatus? status, SignUpModel? model, Failures? failures}) {
    return SignUpState(
        model: model ?? this.model,
        failures: failures ?? this.failures,
        status: status ?? this.status);
  }
}

class SignUpInitState extends SignUpState {
  SignUpInitState() : super(status: RequestStatus.init);
}