import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/api/end_points.dart';
import 'package:zen_cart_market/features/productScreen/data/data_sources/products_ds.dart';
import 'package:zen_cart_market/features/productScreen/data/models/SpecificModel.dart';

class ProductDSImpl implements ProductDs {
  ApiManager apiManager;

  ProductDSImpl(this.apiManager);


  @override
  Future<SpecificProductModel> getSpecificProduct(String productId) async{
    var response = await apiManager.getData(EndPoints.products+"/$productId");

    SpecificProductModel specificProductModel = SpecificProductModel.fromJson(response.data);
    return specificProductModel;
  }

}
