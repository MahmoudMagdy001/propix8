import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../models/favorite_model.dart';

enum FavoriteStatus { initial, loading, success, failure }

class FavoriteState extends Equatable {
  const FavoriteState({
    this.status = FavoriteStatus.initial,
    this.listStatus = FavoriteStatus.initial,
    this.favorites = const {},
    this.favoriteUnits = const [],
    this.errorMessage,
    this.currentPage = 1,
    this.lastPage = 1,
    this.viewType = ViewType.grid,
  });

  final FavoriteStatus status;
  final FavoriteStatus listStatus;
  final Map<int, bool> favorites;
  final List<FavoriteUnitModel> favoriteUnits;
  final String? errorMessage;
  final int currentPage;
  final int lastPage;
  final ViewType viewType;

  bool get hasMore => currentPage < lastPage;

  bool get shouldShowErrorWidget =>
      listStatus == FavoriteStatus.failure && favoriteUnits.isEmpty;

  FavoriteState copyWith({
    FavoriteStatus? status,
    FavoriteStatus? listStatus,
    Map<int, bool>? favorites,
    List<FavoriteUnitModel>? favoriteUnits,
    String? errorMessage,
    int? currentPage,
    int? lastPage,
    ViewType? viewType,
  }) => FavoriteState(
    status: status ?? this.status,
    listStatus: listStatus ?? this.listStatus,
    favorites: favorites ?? this.favorites,
    favoriteUnits: favoriteUnits ?? this.favoriteUnits,
    errorMessage: errorMessage ?? this.errorMessage,
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
    viewType: viewType ?? this.viewType,
  );

  @override
  List<Object?> get props => [
    status,
    listStatus,
    favorites,
    favoriteUnits,
    errorMessage,
    currentPage,
    lastPage,
    viewType,
  ];
}
