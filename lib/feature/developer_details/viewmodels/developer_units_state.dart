import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../home/viewmodels/home_state.dart';
import '../models/developer_collection_model.dart';

class DeveloperUnitsState extends Equatable {
  const DeveloperUnitsState({
    this.status = HomeRequestStatus.initial,
    this.developer,
    this.errorMessage,
    this.viewType = ViewType.grid,
    this.isLoadingMore = false,
  });
  final HomeRequestStatus status;
  final DeveloperCollectionModel? developer;
  final String? errorMessage;
  final ViewType viewType;
  final bool isLoadingMore;

  DeveloperUnitsState copyWith({
    HomeRequestStatus? status,
    DeveloperCollectionModel? developer,
    String? errorMessage,
    ViewType? viewType,
    bool? isLoadingMore,
  }) => DeveloperUnitsState(
    status: status ?? this.status,
    developer: developer ?? this.developer,
    errorMessage: errorMessage ?? this.errorMessage,
    viewType: viewType ?? this.viewType,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
  );

  @override
  List<Object?> get props => [
    status,
    developer,
    errorMessage,
    viewType,
    isLoadingMore,
  ];
}
