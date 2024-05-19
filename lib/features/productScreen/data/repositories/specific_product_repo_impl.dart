import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/productScreen/data/data_sources/products_ds.dart';
import 'package:zen_cart_market/features/productScreen/data/models/SpecificModel.dart';
import 'package:zen_cart_market/features/productScreen/domain/repositories/specific_product_repo.dart';

class SpecificProductRepoImpl extends SpecificProductRepo {
  ProductDs productDs;

  SpecificProductRepoImpl(this.productDs);

  @override
  Future<Either<Failures, SpecificProductModel>> getSpecificProduct(String productId) async{

    try{
      var result = await productDs.getSpecificProduct(productId);
      return right(result);
    }catch(e){
      return left(RemoteFailures(e.toString()));
    }

  }
}
