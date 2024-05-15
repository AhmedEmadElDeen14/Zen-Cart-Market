import 'package:zen_cart_market/features/favoriteProduct/data/models/DeleteResponse.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/WishlistModel.dart';

abstract class WishlistDs{
  Future<WishlistModel> getWishlist();
  Future<WishlistModel> addToWishlist(String productId);
  Future<DeleteResponse> deleteFromWishlist(String productId);
}