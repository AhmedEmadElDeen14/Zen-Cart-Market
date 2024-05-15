import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/WishlistModel.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/repositories/wishlist_repo.dart';

class WishlistUseCase {
  WishlistRepo repo;
  WishlistUseCase(this.repo);

  Future<Either<Failures, WishlistModel>> call() => repo.getWishlist();
}