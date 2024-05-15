import 'package:dartz/dartz.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/logIn/data/data_sources/login_local_ds.dart';
import 'package:zen_cart_market/features/logIn/data/models/UserModel.dart';
import 'package:zen_cart_market/features/logIn/domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRemoteDS loginRemoteDS;

  LoginRepoImpl(this.loginRemoteDS);

  @override
  Future<Either<Failures, UserModel>> login(
      String email, String password) async {
    try {
      var userModel = await loginRemoteDS.login(email, password);
      return Right(userModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
