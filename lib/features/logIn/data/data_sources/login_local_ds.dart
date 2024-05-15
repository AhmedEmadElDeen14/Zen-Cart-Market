import 'package:zen_cart_market/features/logIn/data/models/UserModel.dart';

abstract class LoginRemoteDS {
  Future<UserModel> login(String email, String password);
}