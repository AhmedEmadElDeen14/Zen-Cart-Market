import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zen_cart_market/core/enums/enums.dart';
import 'package:zen_cart_market/core/errors/failure.dart';
import 'package:zen_cart_market/features/categoryDetails/data/models/SubCategories.dart';
import 'package:zen_cart_market/features/categoryDetails/domain/use_cases/get_sub_category_useCase.dart';

part 'sub_category_event.dart';

part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  GetSubCategoryUseCase getSubCategoryUseCase;
  String categoryId;

  SubCategoryBloc(
      {required this.getSubCategoryUseCase, required this.categoryId})
      : super(SubCategoryInitial()) {
    on<SubCategoryEvent>((event, emit) async {
      emit(state.copyWith(type: ScreenType.loading));
      var res = await getSubCategoryUseCase.call(categoryId);
      res.fold(
          (l) => emit(
              state.copyWith(type: ScreenType.categoryFailures, failures: l)),
          (r) => emit(state.copyWith(
              type: ScreenType.categorySuccess, subCategories: r))
      );
    });
  }
}
