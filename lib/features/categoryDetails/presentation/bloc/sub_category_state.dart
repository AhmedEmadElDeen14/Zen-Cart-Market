part of 'sub_category_bloc.dart';

@immutable
class SubCategoryState {
  ScreenType? type;
  Failures? failures;
  SubCategories? subCategories;

  SubCategoryState({this.type, this.failures, this.subCategories});

  SubCategoryState copyWith({
    ScreenType? type,
    Failures? failures,
    SubCategories? subCategories,
  }) {
    return SubCategoryState(
        type: type ?? this.type,
        failures: failures ?? this.failures,
        subCategories: subCategories ?? this.subCategories);
  }
}

final class SubCategoryInitial extends SubCategoryState {
  SubCategoryInitial() : super(type: ScreenType.init);
}
