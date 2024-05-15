import 'package:dio/dio.dart';
import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/api/end_points.dart';
import 'package:zen_cart_market/features/logIn/data/data_sources/login_local_ds.dart';
import 'package:zen_cart_market/features/logIn/data/models/UserModel.dart';

class LoginRemoteDSImpl implements LoginRemoteDS {
  ApiManager apiManager;

  LoginRemoteDSImpl(this.apiManager);

  @override
  Future<UserModel> login(String email, String password) async {
    Response response = await apiManager.postData(EndPoints.login,
        body: {"email": email, "password": password});

    UserModel userModel = UserModel.fromJson(response.data);
    return userModel;
  }
}
