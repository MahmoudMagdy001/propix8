import 'package:equatable/equatable.dart';

import 'package:propix8/feature/maintenance_services/models/maintenance_service_model.dart';

enum MaintenanceRequestStatus { initial, loading, success, failure }

class MaintenanceServicesState extends Equatable {
  const MaintenanceServicesState({
    this.status = MaintenanceRequestStatus.initial,
    this.data,
    this.errorMessage,
    this.bookedServiceIds = const {},
  });
  final MaintenanceRequestStatus status;
  final MaintenanceData? data;
  final String? errorMessage;
  final Set<int> bookedServiceIds;

  MaintenanceServicesState copyWith({
    MaintenanceRequestStatus? status,
    MaintenanceData? data,
    String? errorMessage,
    Set<int>? bookedServiceIds,
    bool clearData = false,
  }) => MaintenanceServicesState(
    status: status ?? this.status,
    data: clearData ? null : (data ?? this.data),
    errorMessage: errorMessage ?? this.errorMessage,
    bookedServiceIds: bookedServiceIds ?? this.bookedServiceIds,
  );

  bool get isLoading => status == MaintenanceRequestStatus.loading;
  bool get isFailure => status == MaintenanceRequestStatus.failure;
  bool get isSuccess => status == MaintenanceRequestStatus.success;

  bool get isEmpty {
    if (data == null) return true;
    return data!.home.isEmpty && data!.technical.isEmpty;
  }

  bool get shouldShowErrorWidget => isFailure && (data == null || isEmpty);
  bool get shouldShowLoading => isLoading && (data == null || isEmpty);

  @override
  List<Object?> get props => [status, data, errorMessage, bookedServiceIds];
}
