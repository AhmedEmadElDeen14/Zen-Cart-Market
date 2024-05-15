import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/register/data/models/SignUpModel.dart';
import 'package:zen_cart_market/features/register/domain/entities/SignUpRequestModel.dart';

abstract class SignUpRepo {
  Future<Either<Failures, SignUpModel>> signUp(SignUpRequestModel requestModel);
}