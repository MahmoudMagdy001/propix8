import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../home/models/unit_model.dart';

enum ChooseProductStatus { initial, loading, success, failure }

class ChooseProductState extends Equatable {
  const ChooseProductState({
    this.status = ChooseProductStatus.initial,
    this.errorMessage,
    this.units = const [],
    this.viewType = ViewType.grid,
    this.currentPage = 1,
    this.lastPage = 1,
  });

  final ChooseProductStatus status;
  final String? errorMessage;
  final List<UnitModel> units;
  final ViewType viewType;
  final int currentPage;
  final int lastPage;

  bool get hasMore => currentPage < lastPage;

  ChooseProductState copyWith({
    ChooseProductStatus? status,
    String? errorMessage,
    List<UnitModel>? units,
    ViewType? viewType,
    int? currentPage,
    int? lastPage,
  }) => ChooseProductState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    units: units ?? this.units,
    viewType: viewType ?? this.viewType,
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
  );

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    units,
    viewType,
    currentPage,
    lastPage,
  ];
}
