import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';
import 'package:zen_cart_market/features/home/domain/repositories/home_repo.dart';

class GetProductsUseCase {
  HomeRepo repo;

  GetProductsUseCase(this.repo);

  Future<Either<Failures, ProductModel>> call() async => repo.getProducts();
}