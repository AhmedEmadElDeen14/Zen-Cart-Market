import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';

abstract class SubCategoryRepo{
  Future<Either<Failures, SubCategories>> getSubCategories(String categoryId);
}