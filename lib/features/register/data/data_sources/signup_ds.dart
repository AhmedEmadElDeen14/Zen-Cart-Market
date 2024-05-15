import 'package:zen_cart_market/features/register/data/models/SignUpModel.dart';
import 'package:zen_cart_market/features/register/domain/entities/SignUpRequestModel.dart';

abstract class SignUpDS{

  Future<SignUpModel> signUp(SignUpRequestModel requestModel);
}