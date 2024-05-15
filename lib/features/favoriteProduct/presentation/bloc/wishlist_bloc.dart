import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/DeleteResponse.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/WishlistModel.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/add_product_to_wishlist_useCase.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/delete_product_from_wishlist.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/use_cases/wishlist_useCase.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistUseCase wishlistUseCase;
  AddProductToWishlistUseCase addProductToWishlistUseCase;
  DeleteProductFromWishlistUseCase deleteProductFromWishlistUseCase;

  WishlistBloc(this.wishlistUseCase, this.addProductToWishlistUseCase,
      this.deleteProductFromWishlistUseCase)
      : super(WishlistInitial()) {
    on<GetWishlistEvent>((event, emit) async {
      emit(state.copyWith(type: ScreenType.loading));
      var res = await wishlistUseCase.call();
      res.fold((l) {
        emit(state.copyWith(type: ScreenType.wishlistFailures, failures: l));
      }, (r) {
        emit(
            state.copyWith(type: ScreenType.wishlistSuccess, wishlistModel: r));
      });
    });

    on<AddProductToWishlistEvent>((event, emit) async {
      emit(state.copyWith(type: ScreenType.loading));
      var res = await addProductToWishlistUseCase.call(event.productId);
      res.fold((l) {
        emit(state.copyWith(type: ScreenType.wishlistFailures, failures: l));
      }, (r) {
        emit(
            state.copyWith(type: ScreenType.wishlistSuccess, wishlistModel: r));
      });
    });

    on<DeleteProductFromWishlistEvent>((event, emit) async {
      emit(state.copyWith(type: ScreenType.loading));
      var res = await deleteProductFromWishlistUseCase.call(event.productId);
      res.fold((l) {
        emit(state.copyWith(type: ScreenType.wishlistFailures, failures: l));
      }, (r) {
        emit(
            state.copyWith(type: ScreenType.wishlistSuccess, deleteResponse: r));
      });
    });

  }
}
