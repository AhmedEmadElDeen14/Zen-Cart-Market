import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/DeleteResponse.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/WishlistModel.dart';

abstract class WishlistRepo{
  Future<Either<Failures, WishlistModel>> getWishlist();
  Future<Either<Failures, WishlistModel>> addToWishlist(String productId);
  Future<Either<Failures, DeleteResponse>> deleteFromWishlist(String productId);


}