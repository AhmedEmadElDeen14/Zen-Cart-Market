part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class GetWishlistEvent extends WishlistEvent {}

class AddProductToWishlistEvent extends WishlistEvent {
  String productId;

  AddProductToWishlistEvent({required this.productId});
}

class DeleteProductFromWishlistEvent extends WishlistEvent {
  String productId;

  DeleteProductFromWishlistEvent({required this.productId});
}
