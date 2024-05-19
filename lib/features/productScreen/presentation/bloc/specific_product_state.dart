part of 'specific_product_bloc.dart';

@immutable
 class SpecificProductState {
  ScreenType? type;
  Failures? failures;
  SpecificProductModel? specificProductModel;

  SpecificProductState({this.type, this.failures, this.specificProductModel});

  SpecificProductState copyWith({
    ScreenType? type,
    Failures? failures,
    SpecificProductModel? specificProductModel,
  }) {
    return SpecificProductState(
        type: type ?? this.type,
        failures: failures ?? this.failures,
        specificProductModel: specificProductModel ?? this.specificProductModel);
  }
}

final class SpecificProductInitial extends SpecificProductState {
  SpecificProductInitial() : super(type: ScreenType.init);

}
