import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/cart/data/data_sources/cart_ds.dart';
import 'package:zen_cart_market/features/cart/data/models/CartModel.dart';
import 'package:zen_cart_market/features/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {

  CartDS cartDS;


  CartRepoImpl(this.cartDS);

  @override
  Future<Either<Failures, CartModel>> getCart() async{
    try {
      var result = await cartDS.getCart();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartModel>> editQuantity(int numOfQuantity, String productId) async{
    try{
      var result = await cartDS.editQuantity(numOfQuantity, productId);
      return Right(result);
    }catch (e){
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartModel>> addItem(String productId) async{
    try{
      var result = await cartDS.addItem(productId);
      return Right(result);
    }catch (e){
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartModel>> removeSpecificCartItem(String productId) async{
    try{
      var result = await cartDS.removeSpecificCartItem(productId);
      return Right(result);
    }catch (e){
      return Left(RemoteFailures(e.toString()));
    }
  }
}