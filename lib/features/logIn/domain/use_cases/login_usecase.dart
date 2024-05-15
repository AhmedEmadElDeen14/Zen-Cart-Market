import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/logIn/data/models/UserModel.dart';
import 'package:zen_cart_market/features/logIn/domain/repositories/login_repo.dart';

class LoginUseCase {
  LoginRepo repo;

  LoginUseCase(this.repo);

  Future<Either<Failures, UserModel>> call(String email, String password) =>
      repo.login(email, password);
}
