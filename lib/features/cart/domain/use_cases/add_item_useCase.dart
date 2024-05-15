import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/cart/data/models/CartModel.dart';
import 'package:zen_cart_market/features/cart/domain/repositories/cart_repo.dart';

class AddItemUseCase {
  CartRepo repo;

  AddItemUseCase(this.repo);

  Future<Either<Failures, CartModel>> call(String productId) =>
      repo.addItem(productId);
}
