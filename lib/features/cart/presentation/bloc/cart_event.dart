part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class GetCartEvent extends CartEvent {}

class EditQuantityEvent extends CartEvent {
  int numOfQuantity;
  String productId;

  EditQuantityEvent({required this.numOfQuantity, required this.productId});
}

class AddItemEvent extends CartEvent {
  String productId;

  AddItemEvent({required this.productId});
}

class RemoveSpecificCartItemEvent extends CartEvent {
  String productId;

  RemoveSpecificCartItemEvent({required this.productId});
}
