part of 'home_bloc.dart';

@immutable
class HomeState {
  ScreenType? type;
  Failures? failures;
  BrandModel? brandModel;
  CategoryModel? categoryModel;
  ProductModel? productModel;
  SubCategories? subCategories;

  HomeState(
      {this.type,
      this.failures,
      this.productModel,
      this.categoryModel,
      this.brandModel,
      this.subCategories});

  HomeState copyWith(
      {ScreenType? type,
      Failures? failures,
      BrandModel? brandModel,
      CategoryModel? categoryModel,
      ProductModel? productModel,
      SubCategories? subCategories}) {
    return HomeState(
      type: type ?? this.type,
      brandModel: brandModel ?? this.brandModel,
      categoryModel: categoryModel ?? this.categoryModel,
      productModel: productModel ?? this.productModel,
      failures: failures ?? this.failures,
      subCategories: subCategories ?? this.subCategories,
    );
  }
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(type: ScreenType.init);
}
