import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/page_model.dart';
import '../../models/stat_model.dart';
import '../repositories/pages_repository.dart';

enum PagesStatus { initial, loading, success, failure }

class PagesState extends Equatable {
  const PagesState({
    this.status = PagesStatus.initial,
    this.pages = const [],
    this.stats = const [],
    this.errorMessage,
  });

  const PagesState.initial()
    : status = PagesStatus.initial,
      pages = const [],
      stats = const [],
      errorMessage = null;

  final PagesStatus status;
  final List<PageModel> pages;
  final List<StatModel> stats;
  final String? errorMessage;

  PagesState copyWith({
    PagesStatus? status,
    List<PageModel>? pages,
    List<StatModel>? stats,
    String? errorMessage,
  }) => PagesState(
    status: status ?? this.status,
    pages: pages ?? this.pages,
    stats: stats ?? this.stats,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [status, pages, stats, errorMessage];
}

class PagesCubit extends Cubit<PagesState> {
  PagesCubit(this._repository) : super(const PagesState.initial());
  final PagesRepository _repository;

  Future<void> loadPages() async {
    emit(state.copyWith(status: PagesStatus.loading));
    final result = await _repository.getPages();
    if (isClosed) return;
    result.fold(
      (errorMessage) => emit(
        state.copyWith(status: PagesStatus.failure, errorMessage: errorMessage),
      ),
      (pages) =>
          emit(state.copyWith(status: PagesStatus.success, pages: pages)),
    );
  }

  Future<void> loadStats() async {
    emit(state.copyWith(status: PagesStatus.loading));
    final result = await _repository.getStats();
    if (isClosed) return;
    result.fold(
      (errorMessage) => emit(
        state.copyWith(status: PagesStatus.failure, errorMessage: errorMessage),
      ),
      (stats) =>
          emit(state.copyWith(status: PagesStatus.success, stats: stats)),
    );
  }

  Future<void> loadAll() async {
    emit(state.copyWith(status: PagesStatus.loading));
    final pagesResult = await _repository.getPages();
    final statsResult = await _repository.getStats();
    if (isClosed) return;

    pagesResult.fold(
      (errorMessage) => emit(
        state.copyWith(status: PagesStatus.failure, errorMessage: errorMessage),
      ),
      (pages) {
        statsResult.fold(
          (errorMessage) => emit(
            state.copyWith(
              status: PagesStatus.failure,
              errorMessage: errorMessage,
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

  PageModel? getPageBySlug(String slug) {
    try {
      return state.pages.firstWhere((page) => page.slug == slug);
    } catch (_) {
      return null;
    }
  }
}
