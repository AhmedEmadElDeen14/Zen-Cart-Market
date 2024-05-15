import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/home/data/models/BrandModel.dart';
import 'package:zen_cart_market/features/home/data/models/CategoryModel.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';

abstract class HomeDS{

  Future<BrandModel>getBrands();
  Future<CategoryModel>getCategories();
  Future<ProductModel>getProducts();
  Future<SubCategories>getSubCategories();
}