import 'package:equatable/equatable.dart';

import '../../../../core/models/pagination_model.dart';
import '../../../../core/utils/enums.dart';
import '../models/unit_model.dart';
import 'home_state.dart' show HomeRequestStatus;

class NearbyUnitsState extends Equatable {
  const NearbyUnitsState({
    this.status = HomeRequestStatus.initial,
    this.units = const [],
    this.pagination,
    this.viewType = ViewType.list,
    this.errorMessage,
    this.isLoadingMore = false,
  });

  final HomeRequestStatus status;
  final List<UnitModel> units;
  final PaginationModel? pagination;
  final ViewType viewType;
  final String? errorMessage;
  final bool isLoadingMore;

  NearbyUnitsState copyWith({
    HomeRequestStatus? status,
    List<UnitModel>? units,
    PaginationModel? pagination,
    ViewType? viewType,
    String? errorMessage,
    bool? isLoadingMore,
  }) => NearbyUnitsState(
    status: status ?? this.status,
    units: units ?? this.units,
    pagination: pagination ?? this.pagination,
    viewType: viewType ?? this.viewType,
    errorMessage: errorMessage ?? this.errorMessage,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
  );

  @override
  List<Object?> get props => [
    status,
    units,
    pagination,
    viewType,
    errorMessage,
    isLoadingMore,
  ];
}
