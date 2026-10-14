import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/developer_details/domain/entities/developer_collection_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

part 'developer_units_state.freezed.dart';

@freezed
abstract class DeveloperUnitsState with _$DeveloperUnitsState {
  const factory DeveloperUnitsState({
    @Default(HomeRequestStatus.initial) HomeRequestStatus status,
    DeveloperCollectionEntity? developer,
    String? errorMessage,
    @Default(ViewType.grid) ViewType viewType,
    @Default(false) bool isLoadingMore,
  }) = _DeveloperUnitsState;
}
