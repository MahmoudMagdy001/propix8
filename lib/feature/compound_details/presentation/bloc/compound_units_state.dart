import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/compound_details/domain/entities/compound_collection_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

part 'compound_units_state.freezed.dart';

@freezed
abstract class CompoundUnitsState with _$CompoundUnitsState {
  const factory CompoundUnitsState({
    @Default(HomeRequestStatus.initial) HomeRequestStatus status,
    CompoundCollectionEntity? compound,
    String? errorMessage,
    @Default(ViewType.grid) ViewType viewType,
    @Default(false) bool isLoadingMore,
  }) = _CompoundUnitsState;
}
