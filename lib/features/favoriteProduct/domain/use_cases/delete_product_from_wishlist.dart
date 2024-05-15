import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/DeleteResponse.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/repositories/wishlist_repo.dart';

class DeleteProductFromWishlistUseCase {
  WishlistRepo repo;

  DeleteProductFromWishlistUseCase(this.repo);

  Future<Either<Failures, DeleteResponse>> call(String productId) =>
      repo.deleteFromWishlist(productId);
}
