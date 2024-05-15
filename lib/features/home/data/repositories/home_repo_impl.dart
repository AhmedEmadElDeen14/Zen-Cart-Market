import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/home/data/data_sources/home_ds.dart';
import 'package:zen_cart_market/features/home/data/models/BrandModel.dart';
import 'package:zen_cart_market/features/home/data/models/CategoryModel.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';
import 'package:zen_cart_market/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeDS homeDS;

  HomeRepoImpl(this.homeDS);

  @override
  Future<Either<Failures, BrandModel>> getBrands() async {
    try {
      var result = await homeDS.getBrands();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryModel>> getCategories() async {
    try {
      var result = await homeDS.getCategories();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      var result = await homeDS.getProducts();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, SubCategories>> getSubCategories() async {
    try {
      var result = await homeDS.getSubCategories();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
