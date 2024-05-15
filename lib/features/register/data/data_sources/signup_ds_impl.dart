import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/api/end_points.dart';
import 'package:zen_cart_market/features/register/data/data_sources/signup_ds.dart';
import 'package:zen_cart_market/features/register/data/models/SignUpModel.dart';
import 'package:zen_cart_market/features/register/domain/entities/SignUpRequestModel.dart';

class SignUpDSImpl implements SignUpDS {
  @override
  Future<SignUpModel> signUp(SignUpRequestModel requestModel) async {
    ApiManager apiManager = ApiManager();

    var response = await apiManager.postData(EndPoints.signUp,
        body: requestModel.toJson());

    SignUpModel signUpModel = SignUpModel.fromJson(response.data);
    return signUpModel;
  }
}