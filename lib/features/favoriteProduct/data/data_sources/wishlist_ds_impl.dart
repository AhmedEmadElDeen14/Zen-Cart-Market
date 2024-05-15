import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/api/end_points.dart';
import 'package:zen_cart_market/core/cache/shared_pref.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/data_sources/wishlist_ds.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/DeleteResponse.dart';
import 'package:zen_cart_market/features/favoriteProduct/data/models/WishlistModel.dart';

class WishlistDsImpl implements WishlistDs {
  ApiManager apiManager;
  String? token = CacheHelper.getToken("Token");

  WishlistDsImpl(this.apiManager);

  @override
  Future<WishlistModel> getWishlist() async {
    var response =
        await apiManager.getData(EndPoints.wishlist, headers: {"token": token});

    WishlistModel wishlistModel = WishlistModel.fromJson(response.data);
    return wishlistModel;
  }

  @override
  Future<WishlistModel> addToWishlist(String productId) async {
    var response = await apiManager.postData(EndPoints.wishlist, body: {
      "productId": productId,
    }, headers: {
      "token": token
    });

    WishlistModel wishlistModel = WishlistModel.fromJson(response.data);
    return wishlistModel;
  }

  @override
  Future<DeleteResponse> deleteFromWishlist(String productId) async {
    var response = await apiManager.deleteData("${EndPoints.wishlist}/${productId}/",
        headers: {"token": token});

    DeleteResponse deleteResponse = DeleteResponse.fromJson(response.data);
    return deleteResponse;
  }
}
