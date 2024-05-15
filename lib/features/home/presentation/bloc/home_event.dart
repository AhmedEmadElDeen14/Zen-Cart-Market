part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeGetCategoryEvent extends HomeEvent {}

class HomeGetBrandsEvent extends HomeEvent {}

class HomeGetProductsEvent extends HomeEvent {}

class HomeGetSubCategoriesEvent extends HomeEvent {}



class AddToCartEvent extends HomeEvent {
  String id;

  AddToCartEvent(this.id);
}

class HomeChangeNavBarEvent extends HomeEvent {
  int index;

  HomeChangeNavBarEvent(this.index);
}