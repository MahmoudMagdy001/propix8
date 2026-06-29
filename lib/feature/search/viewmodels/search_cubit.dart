import 'package:propix8/core/shared/bloc/safe_bloc.dart';

import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/home/repositories/unit_repository.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';
import 'package:propix8/feature/search/viewmodels/search_state.dart';

class SearchCubit extends SafeCubit<SearchState> {
  SearchCubit(this._unitRepository) : super(const SearchState());
  final UnitRepository _unitRepository;

  Future<void> search(String query) async {
    if (query == state.query && state.status == HomeRequestStatus.loading) {
      return;
    }

    if (query.isEmpty) {
      emit(const SearchState());
      return;
    }

    emit(
      state.copyWith(
        status: HomeRequestStatus.loading,
        query: query,
        currentPage: 1,
        results: [],
      ),
    );

    try {
      final response = await _unitRepository.getAllUnits(searchQuery: query);

      if (isClosed) return;

      emit(
        state.copyWith(
          status: HomeRequestStatus.success,
          results: response.units,
          lastPage: response.pagination?.lastPage ?? 1,
        ),
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadMore() async {
    if (state.loadMoreStatus == HomeRequestStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(loadMoreStatus: HomeRequestStatus.loading));

    try {
      final nextPage = state.currentPage + 1;
      final response = await _unitRepository.getAllUnits(
        page: nextPage,
        searchQuery: state.query,
      );

      if (isClosed) return;

      emit(
        state.copyWith(
          loadMoreStatus: HomeRequestStatus.success,
          results: [...state.results, ...response.units],
          currentPage: nextPage,
          lastPage: response.pagination?.lastPage ?? state.lastPage,
        ),
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          loadMoreStatus: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void toggleViewType() {
    final nextType = state.viewType == ViewType.grid
        ? ViewType.list
        : ViewType.grid;
    emit(state.copyWith(viewType: nextType));
  }

  void clearSearch() {
    emit(const SearchState());
  }
}
