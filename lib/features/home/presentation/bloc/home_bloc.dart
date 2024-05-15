import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/home/data/models/BrandModel.dart';
import 'package:zen_cart_market/features/home/data/models/CategoryModel.dart';
import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_brands_useCase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_categories_useCase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_products_usecase.dart';
import 'package:zen_cart_market/features/home/domain/use_cases/get_sub_categories_useCase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetBrandsUseCase getBrandsUseCase;
  GetProductsUseCase getProductsUseCase;
  GetCategoriesUseCase getCategoriesUseCase;
  GetSubCategoriesUseCase getSubCategoriesUseCase;

  HomeBloc({
    required this.getBrandsUseCase,
    required this.getProductsUseCase,
    required this.getCategoriesUseCase,
    required this.getSubCategoriesUseCase,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeGetBrandsEvent) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getBrandsUseCase.call();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.brandsError, failures: l));
        }, (r) {
          emit(state.copyWith(type: ScreenType.brandsSuccess, brandModel: r));
        });
      } else if (event is HomeGetCategoryEvent) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getCategoriesUseCase.call();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.categoryFailures, failures: l));
        }, (r) {
          emit(
              state.copyWith(type: ScreenType.brandsSuccess, categoryModel: r));
        });
      } else if (event is HomeGetProductsEvent) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getProductsUseCase.call();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.productsFailures, failures: l));
        }, (r) {
          emit(state.copyWith(
              type: ScreenType.productsSuccess, productModel: r));
        });
      } else if (event is HomeGetSubCategoriesEvent) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getSubCategoriesUseCase.call();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.productsFailures, failures: l));
        }, (r) {
          emit(state.copyWith(
              type: ScreenType.productsSuccess, subCategories: r));
        });
      }
    });
  }
}
