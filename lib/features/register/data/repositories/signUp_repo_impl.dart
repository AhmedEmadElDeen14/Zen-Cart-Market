import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/register/data/data_sources/signup_ds.dart';
import 'package:zen_cart_market/features/register/data/models/SignUpModel.dart';
import 'package:zen_cart_market/features/register/domain/entities/SignUpRequestModel.dart';
import 'package:zen_cart_market/features/register/domain/repositories/signUp_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  SignUpDS signUpDS;

  SignUpRepoImpl(this.signUpDS);

  @override
  Future<Either<Failures, SignUpModel>> signUp(
      SignUpRequestModel requestModel) async {
    try {
      var result = await signUpDS.signUp(requestModel);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
