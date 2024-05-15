import 'package:zen_cart_market/features/cart/data/models/CartModel.dart';

abstract class CartDS {
  Future<CartModel> getCart();
  Future<CartModel> editQuantity(int numOfQuantity, String productId);
  Future<CartModel> addItem(String productId);
  Future<CartModel> removeSpecificCartItem(String productId);
}
