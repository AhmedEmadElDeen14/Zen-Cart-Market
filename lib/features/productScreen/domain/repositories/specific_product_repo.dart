import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/productScreen/data/models/SpecificModel.dart';

abstract class SpecificProductRepo{
  Future<Either<Failures, SpecificProductModel>> getSpecificProduct(String categoryId);
}