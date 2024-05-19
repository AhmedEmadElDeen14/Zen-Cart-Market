import 'package:zen_cart_market/features/productScreen/data/models/SpecificModel.dart';

abstract class ProductDs{

  Future<SpecificProductModel>getSpecificProduct(String productId);

}