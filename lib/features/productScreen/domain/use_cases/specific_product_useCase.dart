import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/productScreen/data/models/SpecificModel.dart';
import 'package:zen_cart_market/features/productScreen/domain/repositories/specific_product_repo.dart';

class GetSpecificProductUseCase{
  SpecificProductRepo repo;

  GetSpecificProductUseCase(this.repo);

  Future<Either<Failures, SpecificProductModel>> call(String productId) => repo.getSpecificProduct(productId);
}