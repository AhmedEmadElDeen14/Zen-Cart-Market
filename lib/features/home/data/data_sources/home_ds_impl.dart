import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/api/end_points.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/home/data/data_sources/home_ds.dart';
import 'package:zen_cart_market/features/home/data/models/BrandModel.dart';
import 'package:zen_cart_market/features/home/data/models/CategoryModel.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';

class HomeDSImpl implements HomeDS {
  ApiManager apiManager;

  HomeDSImpl(this.apiManager);

  @override
  Future<BrandModel> getBrands() async {
    var response = await apiManager.getData(EndPoints.brands);

    BrandModel brandModel = BrandModel.fromJson(response.data);
    return brandModel;
  }

  @override
  Future<CategoryModel> getCategories() async {
    var response = await apiManager.getData(EndPoints.categories);

    CategoryModel categoryModel = CategoryModel.fromJson(response.data);
    return categoryModel;
  }

  @override
  Future<ProductModel> getProducts() async {
    var response = await apiManager.getData(EndPoints.products);

    ProductModel productModel = ProductModel.fromJson(response.data);
    return productModel;
  }

  @override
  Future<SubCategories> getSubCategories() async{
    var response = await apiManager.getData(EndPoints.subCategories);

    SubCategories subCategories = SubCategories.fromJson(response.data);
    return subCategories;
  }
}
