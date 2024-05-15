import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/home/data/models/CategoryModel.dart';
import 'package:zen_cart_market/features/home/domain/repositories/home_repo.dart';

class GetCategoriesUseCase {
  HomeRepo repo;
  GetCategoriesUseCase(this.repo);

  Future<Either<Failures, CategoryModel>> call() => repo.getCategories();
}