import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/logIn/data/models/UserModel.dart';
import 'package:zen_cart_market/features/logIn/domain/use_cases/login_usecase.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginButtonEvent>((event, emit) async {
      emit(state.copyWith(status: RequestStatus.loading));

      var result = await loginUseCase(event.email, event.password);

      result.fold((l) {
        emit(state.copyWith(status: RequestStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(status: RequestStatus.success, userModel: r));
      });
    });
  }
}
