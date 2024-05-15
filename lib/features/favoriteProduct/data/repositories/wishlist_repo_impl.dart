import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/data_sources/wishlist_ds.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/DeleteResponse.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/WishlistModel.dart';
import 'package:zen_cart_market/features/favoriteProduct/domain/repositories/wishlist_repo.dart';

class WishlistRepoImpl implements WishlistRepo {
  WishlistDs wishlistDs;

  WishlistRepoImpl(this.wishlistDs);

  @override
  Future<Either<Failures, WishlistModel>> getWishlist() async {
    try {
      var result = await wishlistDs.getWishlist();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, WishlistModel>> addToWishlist(
      String productId) async {
    try {
      var result = await wishlistDs.addToWishlist(productId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, DeleteResponse>> deleteFromWishlist(
      String productId) async {
    try {
      var result = await wishlistDs.deleteFromWishlist(productId);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
