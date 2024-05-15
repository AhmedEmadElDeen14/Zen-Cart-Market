import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/register/data/models/SignUpModel.dart';
import 'package:zen_cart_market/features/register/domain/entities/SignUpRequestModel.dart';
import 'package:zen_cart_market/features/register/domain/use_cases/signup_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpUseCase signUpUseCase;

  SignUpBloc(this.signUpUseCase) : super(SignUpInitState()) {
    on<SignUpButtonEvent>((event, emit) async{
      emit(state.copyWith(
        status: RequestStatus.loading,
      ));
      var result = await signUpUseCase(event.requestModel);

      result.fold((l) {
        emit(state.copyWith(status: RequestStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(status: RequestStatus.success, model: r));
      });
    });
  }
}
