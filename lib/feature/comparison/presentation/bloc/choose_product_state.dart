import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

part 'choose_product_state.freezed.dart';

enum ChooseProductStatus { initial, loading, success, failure }

@freezed
abstract class ChooseProductState with _$ChooseProductState {
  const ChooseProductState._();

  const factory ChooseProductState({
    @Default(ChooseProductStatus.initial) ChooseProductStatus status,
    @Default([]) List<UnitEntity> units,
    @Default(ViewType.grid) ViewType viewType,
    String? errorMessage,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
  }) = _ChooseProductState;

  bool get hasMore => currentPage < lastPage;
}
