import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/cart/data/models/CartModel.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/add_item_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/cart_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/edit_quantity_useCase.dart';
import 'package:zen_cart_market/features/cart/domain/use_cases/remove_specific_cart_item_useCase.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartUseCase getCartUseCase;
  EditCartUseCase editCartUseCase;
  AddItemUseCase addItemUseCase;
  RemoveSpecificCartItemUseCase removeSpecificCartItemUseCase;

  CartBloc(this.getCartUseCase, this.editCartUseCase, this.addItemUseCase,
      this.removeSpecificCartItemUseCase)
      : super(CartInitial()) {
    on<GetCartEvent>((event, emit) async {
      emit(state.copyWith(type: ScreenType.loading));
      var res = await getCartUseCase.call();
      res.fold((l) {
        emit(state.copyWith(type: ScreenType.cartFailures, failures: l));
      }, (r) {
        emit(state.copyWith(type: ScreenType.cartSuccess, cartModel: r));
      });
    });

    on<EditQuantityEvent>((event, emit) async {
      emit(state.copyWith(type: ScreenType.loading));
      var res =
          await editCartUseCase.call(event.numOfQuantity, event.productId);
      res.fold((l) {
        emit(state.copyWith(type: ScreenType.cartFailures, failures: l));
      }, (r) {
        emit(state.copyWith(type: ScreenType.cartSuccess, cartModel: r));
      });
    });

    on<AddItemEvent>((event, emit) async {
      emit(state.copyWith(type: ScreenType.loading));
      var res = await addItemUseCase.call(event.productId);
      res.fold((l) {
        emit(state.copyWith(type: ScreenType.cartFailures, failures: l));
      }, (r) {
        emit(state.copyWith(type: ScreenType.cartSuccess, cartModel: r));
      });
    });

    on<RemoveSpecificCartItemEvent>((event, emit) async {
      emit(state.copyWith(type: ScreenType.loading));
      var res = await removeSpecificCartItemUseCase.call(event.productId);
      res.fold((l) {
        emit(state.copyWith(type: ScreenType.cartFailures, failures: l));
      }, (r) {
        emit(state.copyWith(type: ScreenType.cartSuccess, cartModel: r));
      });
    });
  }
}
