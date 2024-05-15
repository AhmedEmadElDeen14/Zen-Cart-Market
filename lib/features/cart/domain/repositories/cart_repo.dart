import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/cart/data/models/CartModel.dart';

abstract class CartRepo{
  Future<Either<Failures, CartModel>> getCart();
  Future<Either<Failures, CartModel>> editQuantity(int numOfQuantity, String productId);
  Future<Either<Failures, CartModel>> addItem( String productId);
  Future<Either<Failures, CartModel>> removeSpecificCartItem( String productId);

}