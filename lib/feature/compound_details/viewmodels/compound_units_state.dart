import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../home/viewmodels/home_state.dart';
import '../models/compound_collection_model.dart';

class CompoundUnitsState extends Equatable {
  const CompoundUnitsState({
    this.status = HomeRequestStatus.initial,
    this.compound,
    this.errorMessage,
    this.viewType = ViewType.grid,
    this.isLoadingMore = false,
  });
  final HomeRequestStatus status;
  final CompoundCollectionModel? compound;
  final String? errorMessage;
  final ViewType viewType;
  final bool isLoadingMore;

  CompoundUnitsState copyWith({
    HomeRequestStatus? status,
    CompoundCollectionModel? compound,
    String? errorMessage,
    ViewType? viewType,
    bool? isLoadingMore,
  }) => CompoundUnitsState(
    status: status ?? this.status,
    compound: compound ?? this.compound,
    errorMessage: errorMessage ?? this.errorMessage,
    viewType: viewType ?? this.viewType,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
  );

  @override
  List<Object?> get props => [
    status,
    compound,
    errorMessage,
    viewType,
    isLoadingMore,
  ];
}
