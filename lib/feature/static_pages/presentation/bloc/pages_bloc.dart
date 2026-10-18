import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/static_pages/domain/usecases/get_pages_usecase.dart';
import 'package:propix8/feature/static_pages/domain/usecases/get_stats_usecase.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_event.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_state.dart';

class PagesBloc extends SafeBloc<PagesEvent, PagesState> {
  PagesBloc({
    required GetPagesUseCase getPagesUseCase,
    required GetStatsUseCase getStatsUseCase,
  }) : _getPagesUseCase = getPagesUseCase,
       _getStatsUseCase = getStatsUseCase,
       super(const PagesState()) {
    on<PagesRequested>(_onPagesRequested);
    on<StatsRequested>(_onStatsRequested);
    on<PagesAllDataRequested>(_onAllDataRequested);
  }

  final GetPagesUseCase _getPagesUseCase;
  final GetStatsUseCase _getStatsUseCase;

  Future<void> _onPagesRequested(
    PagesRequested event,
    Emitter<PagesState> emit,
  ) async {
    emit(state.copyWith(status: PagesStatus.loading));
    final result = await _getPagesUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PagesStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (pages) =>
          emit(state.copyWith(status: PagesStatus.success, pages: pages)),
    );
  }

  Future<void> _onStatsRequested(
    StatsRequested event,
    Emitter<PagesState> emit,
  ) async {
    emit(state.copyWith(status: PagesStatus.loading));
    final result = await _getStatsUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PagesStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (stats) =>
          emit(state.copyWith(status: PagesStatus.success, stats: stats)),
    );
  }

  Future<void> _onAllDataRequested(
    PagesAllDataRequested event,
    Emitter<PagesState> emit,
  ) async {
    emit(state.copyWith(status: PagesStatus.loading));
    final pagesResult = await _getPagesUseCase();
    final statsResult = await _getStatsUseCase();

    pagesResult.fold(
      (failure) => emit(
        state.copyWith(
          status: PagesStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (pages) {
        statsResult.fold(
          (failure) => emit(
            state.copyWith(
              status: PagesStatus.failure,
              errorMessage: failure.message,
            ),
          ),
          (stats) => emit(
            state.copyWith(
              status: PagesStatus.success,
              pages: pages,
              stats: stats,
            ),
          ),
        );
      },
    );
  }
}
