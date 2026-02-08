import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../home/models/unit_model.dart';
import '../../home/viewmodels/home_state.dart';

class SearchState extends Equatable {
  const SearchState({
    this.status = HomeRequestStatus.initial,
    this.loadMoreStatus = HomeRequestStatus.initial,
    this.results = const [],
    this.query = '',
    this.currentPage = 1,
    this.lastPage = 1,
    this.errorMessage,
    this.viewType = ViewType.grid,
  });
  final HomeRequestStatus status;
  final HomeRequestStatus loadMoreStatus;
  final List<UnitModel> results;
  final String query;
  final int currentPage;
  final int lastPage;
  final String? errorMessage;
  final ViewType viewType;

  bool get hasMore => currentPage < lastPage;

  SearchState copyWith({
    HomeRequestStatus? status,
    HomeRequestStatus? loadMoreStatus,
    List<UnitModel>? results,
    String? query,
    int? currentPage,
    int? lastPage,
    String? errorMessage,
    ViewType? viewType,
  }) => SearchState(
    status: status ?? this.status,
    loadMoreStatus: loadMoreStatus ?? this.loadMoreStatus,
    results: results ?? this.results,
    query: query ?? this.query,
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
    errorMessage: errorMessage ?? this.errorMessage,
    viewType: viewType ?? this.viewType,
  );

  @override
  List<Object?> get props => [
    status,
    loadMoreStatus,
    results,
    query,
    currentPage,
    lastPage,
    errorMessage,
    viewType,
  ];
}
