import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/productScreen/data/models/SpecificModel.dart';
import 'package:zen_cart_market/features/productScreen/domain/use_cases/specific_product_useCase.dart';

part 'specific_product_event.dart';
part 'specific_product_state.dart';

class SpecificProductBloc extends Bloc<SpecificProductEvent, SpecificProductState> {

  GetSpecificProductUseCase getSpecificProductUseCase;

  SpecificProductBloc(this.getSpecificProductUseCase) : super(SpecificProductInitial()) {
    on<GetSpecificProductEvent>((event, emit) async{
      emit(state.copyWith(type: ScreenType.loading));
      var res = await getSpecificProductUseCase.call(event.id);
      res.fold(
              (l) => emit(
              state.copyWith(type: ScreenType.specificProductFailures, failures: l)),
              (r) => emit(state.copyWith(
              type: ScreenType.specificProductSuccess, specificProductModel: r))
      );
    });
  }
}
