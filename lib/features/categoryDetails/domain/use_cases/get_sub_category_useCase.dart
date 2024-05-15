import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/categoryDetails/domain/repositories/sub_category_repo.dart';

class GetSubCategoryUseCase{
  SubCategoryRepo repo;

  GetSubCategoryUseCase(this.repo);

  Future<Either<Failures, SubCategories>> call(String categoryId) => repo.getSubCategories(categoryId);
}