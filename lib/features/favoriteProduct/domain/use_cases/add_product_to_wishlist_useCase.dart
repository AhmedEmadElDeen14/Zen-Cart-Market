import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/WishlistModel.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/repositories/wishlist_repo.dart';

class AddProductToWishlistUseCase {
  WishlistRepo repo;

  AddProductToWishlistUseCase(this.repo);

  Future<Either<Failures, WishlistModel>> call(String productId) =>
      repo.addToWishlist(productId);
}
