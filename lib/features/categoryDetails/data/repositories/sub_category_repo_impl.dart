import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/categoryDetails/data/data_sources/sub_category_ds.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/categoryDetails/domain/repositories/sub_category_repo.dart';

class SubCategoryRepoImpl extends SubCategoryRepo {
  SubCategoryDS subCategoryDS;

  SubCategoryRepoImpl(this.subCategoryDS);

  @override
  Future<Either<Failures, SubCategories>> getSubCategories(
      String categoryId) async {
    try {
      var result = await subCategoryDS.getSubCategories(categoryId);
      return right(result);
    } catch (e) {
      return left(RemoteFailures(e.toString()));
    }
  }
}
