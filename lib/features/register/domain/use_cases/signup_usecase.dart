import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/register/data/models/SignUpModel.dart';
import 'package:zen_cart_market/features/register/domain/entities/SignUpRequestModel.dart';
import 'package:zen_cart_market/features/register/domain/repositories/signUp_repo.dart';

class SignUpUseCase {
  SignUpRepo repo;

  SignUpUseCase(this.repo);

  Future<Either<Failures, SignUpModel>> call(SignUpRequestModel requestModel) =>
      repo.signUp(requestModel);
}
