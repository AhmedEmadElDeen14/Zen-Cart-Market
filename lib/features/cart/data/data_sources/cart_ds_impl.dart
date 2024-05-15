import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/api/end_points.dart';
import 'package:zen_cart_market/core/cache/shared_pref.dart';
import 'package:zen_cart_market/features/cart/data/data_sources/cart_ds.dart';
import 'package:zen_cart_market/features/cart/data/models/CartModel.dart';

class CartDSImpl implements CartDS {
  ApiManager apiManager;
  String? token = CacheHelper.getToken("Token");

  CartDSImpl(this.apiManager);

  @override
  Future<CartModel> getCart() async {
    var response =
        await apiManager.getData(EndPoints.getCart, headers: {"token": token});

    CartModel cartModel = CartModel.fromJson(response.data);
    return cartModel;
  }

  @override
  Future<CartModel> editQuantity(int numOfQuantity, String productId) async {
    var response = await apiManager.putData(
      "${EndPoints.addToCart}/${productId}/",
      body: {
        "count": numOfQuantity,
      },
      headers: {"token": token},
    );

    CartModel cartModel = CartModel.fromJson(response.data);
    return cartModel;
  }

  @override
  Future<CartModel> addItem(String productId) async {
    var response = await apiManager.postData(
      EndPoints.addToCart,
      body: {
        "productId": productId,
      },
      headers: {"token": token},
    );

    CartModel cartModel = CartModel.fromJson(response.data);
    return cartModel;
  }

  @override
  Future<CartModel> removeSpecificCartItem(String productId) async {
    var response = await apiManager.deleteData(
      EndPoints.addToCart + "/$productId",
      headers: {"token": token},
    );

    CartModel cartModel = CartModel.fromJson(response.data);
    return cartModel;
  }
}
