import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/home/domain/repositories/home_repo.dart';

class GetSubCategoriesUseCase{
  HomeRepo repo;
  GetSubCategoriesUseCase(this.repo);

  Future<Either<Failures, SubCategories>> call() => repo.getSubCategories();
}