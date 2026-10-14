import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/search/domain/usecases/search_units_usecase.dart';
import 'package:propix8/feature/search/presentation/bloc/search_event.dart';
import 'package:propix8/feature/search/presentation/bloc/search_state.dart';

class SearchBloc extends SafeBloc<SearchEvent, SearchState> {
  SearchBloc({required SearchUnitsUseCase searchUnitsUseCase})
    : _searchUnitsUseCase = searchUnitsUseCase,
      super(const SearchState()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SearchLoadMoreRequested>(_onSearchLoadMoreRequested);
    on<SearchViewTypeToggled>(_onSearchViewTypeToggled);
    on<SearchCleared>(_onSearchCleared);
  }

  final SearchUnitsUseCase _searchUnitsUseCase;

  Future<void> _onSearchQueryChanged(SearchQueryChanged event, Emitter<SearchState> emit) async {
    final query = event.query;
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
        results: const [],
        errorMessage: null,
      ),
    );

    final result = await _searchUnitsUseCase(query: query);

    result.fold(
      (failure) => emit(state.copyWith(status: HomeRequestStatus.failure, errorMessage: failure.message)),
      (response) => emit(
        state.copyWith(
          status: HomeRequestStatus.success,
          results: response.data,
          lastPage: response.pagination.lastPage,
        ),
      ),
    );
  }

  Future<void> _onSearchLoadMoreRequested(SearchLoadMoreRequested event, Emitter<SearchState> emit) async {
    if (state.loadMoreStatus == HomeRequestStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(loadMoreStatus: HomeRequestStatus.loading));

    final nextPage = state.currentPage + 1;
    final result = await _searchUnitsUseCase(query: state.query, page: nextPage);

    result.fold(
      (failure) => emit(state.copyWith(loadMoreStatus: HomeRequestStatus.failure, errorMessage: failure.message)),
      (response) => emit(
        state.copyWith(
          loadMoreStatus: HomeRequestStatus.success,
          results: [...state.results, ...response.data],
          currentPage: nextPage,
          lastPage: response.pagination.lastPage,
        ),
      ),
    );
  }

  void _onSearchViewTypeToggled(SearchViewTypeToggled event, Emitter<SearchState> emit) {
    final nextType = state.viewType == ViewType.grid ? ViewType.list : ViewType.grid;
    emit(state.copyWith(viewType: nextType));
  }

  void _onSearchCleared(SearchCleared event, Emitter<SearchState> emit) {
    emit(const SearchState());
  }
}
