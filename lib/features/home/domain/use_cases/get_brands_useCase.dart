import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/home/data/models/BrandModel.dart';
import 'package:zen_cart_market/features/home/domain/repositories/home_repo.dart';

class GetBrandsUseCase {
  HomeRepo repo;
  GetBrandsUseCase(this.repo);

  Future<Either<Failures, BrandModel>> call() => repo.getBrands();
}