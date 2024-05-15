import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';

abstract class SubCategoryDS {
  Future<SubCategories> getSubCategories(String categoryId);
}
