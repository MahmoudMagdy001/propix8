import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();

  const factory SearchState({
    @Default(HomeRequestStatus.initial) HomeRequestStatus status,
    @Default(HomeRequestStatus.initial) HomeRequestStatus loadMoreStatus,
    @Default(<UnitEntity>[]) List<UnitEntity> results,
    @Default('') String query,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    String? errorMessage,
    @Default(ViewType.grid) ViewType viewType,
  }) = _SearchState;

  bool get hasMore => currentPage < lastPage;
}
