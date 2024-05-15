import 'package:zen_cart_market/core/api/api_manager.dart';
import 'package:zen_cart_market/core/api/end_points.dart';
import 'package:zen_cart_market/features/categoryDetails/data/data_sources/sub_category_ds.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';

class SubCategoryDSImpl implements SubCategoryDS {
  ApiManager apiManager;

  SubCategoryDSImpl(this.apiManager);

  @override
  Future<SubCategories> getSubCategories(String categoryId) async {
    var response = await apiManager
        .getData(EndPoints.categories + "/${categoryId}/subcategories");
    print(response);
    SubCategories subCategories = SubCategories.fromJson(response.data);
    return subCategories;
  }
}
