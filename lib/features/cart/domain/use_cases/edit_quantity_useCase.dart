import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/cart/data/models/CartModel.dart';
import 'package:zen_cart_market/features/cart/domain/repositories/cart_repo.dart';

class EditCartUseCase {
  CartRepo repo;

  EditCartUseCase(this.repo);

  Future<Either<Failures, CartModel>> call(
          int numOfQuantity, String productId) =>
      repo.editQuantity(numOfQuantity, productId);
}
