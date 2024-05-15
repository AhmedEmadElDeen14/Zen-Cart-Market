part of 'cart_bloc.dart';

@immutable
class CartState {
  ScreenType? type;
  Failures? failures;
  CartModel? cartModel;

  CartState({this.type, this.failures, this.cartModel});

  CartState copyWith({
    ScreenType? type,
    Failures? failures,
    CartModel? cartModel,
  }) {
    return CartState(
        type: type ?? this.type,
        failures: failures ?? this.failures,
        cartModel: cartModel ?? this.cartModel);
  }
}

final class CartInitial extends CartState {
  CartInitial() : super(type: ScreenType.init);
}
