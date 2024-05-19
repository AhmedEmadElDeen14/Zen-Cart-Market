part of 'specific_product_bloc.dart';

@immutable
sealed class SpecificProductEvent {}

class GetSpecificProductEvent extends SpecificProductEvent {
  String id;

  GetSpecificProductEvent(this.id);
}
