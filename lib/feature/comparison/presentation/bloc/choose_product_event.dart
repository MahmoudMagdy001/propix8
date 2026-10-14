import 'package:freezed_annotation/freezed_annotation.dart';

part 'choose_product_event.freezed.dart';

@freezed
abstract class ChooseProductEvent with _$ChooseProductEvent {
  const factory ChooseProductEvent.unitsLoaded({
    required int excludeId,
    @Default(false) bool isRefresh,
  }) = ChooseProductUnitsLoaded;

  const factory ChooseProductEvent.moreUnitsLoaded({required int excludeId}) =
      ChooseProductMoreUnitsLoaded;

  const factory ChooseProductEvent.viewTypeToggled() =
      ChooseProductViewTypeToggled;
}
