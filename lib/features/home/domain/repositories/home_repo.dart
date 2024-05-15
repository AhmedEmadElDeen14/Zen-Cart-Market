import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/home/data/models/BrandModel.dart';
import 'package:zen_cart_market/features/home/data/models/CategoryModel.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';

abstract class HomeRepo {
  Future<Either<Failures, BrandModel>> getBrands();
  Future<Either<Failures, CategoryModel>> getCategories();
  Future<Either<Failures, ProductModel>> getProducts();
  Future<Either<Failures, SubCategories>> getSubCategories();
}