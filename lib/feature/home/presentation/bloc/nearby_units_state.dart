import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart'
    show HomeRequestStatus;

part 'nearby_units_state.freezed.dart';

@freezed
abstract class NearbyUnitsState with _$NearbyUnitsState {
  const NearbyUnitsState._();

  const factory NearbyUnitsState({
    @Default(HomeRequestStatus.initial) HomeRequestStatus status,
    @Default([]) List<UnitEntity> units,
    PaginationModel? pagination,
    @Default(ViewType.list) ViewType viewType,
    String? errorMessage,
    @Default(false) bool isLoadingMore,
  }) = _NearbyUnitsState;
}
