import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/logIn/data/models/UserModel.dart';

abstract class LoginRepo {
  Future<Either<Failures, UserModel>> login(String email, String password);
}
