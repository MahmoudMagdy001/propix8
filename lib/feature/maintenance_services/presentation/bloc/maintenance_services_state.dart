import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';

part 'maintenance_services_state.freezed.dart';

enum MaintenanceRequestStatus { initial, loading, success, failure }

@freezed
abstract class MaintenanceServicesState with _$MaintenanceServicesState {
  const factory MaintenanceServicesState({
    @Default(MaintenanceRequestStatus.initial) MaintenanceRequestStatus status,
    MaintenanceServicesDataEntity? data,
    @Default(<int>{}) Set<int> bookedServiceIds,
    String? errorMessage,
  }) = _MaintenanceServicesState;
}

extension MaintenanceServicesStateX on MaintenanceServicesState {
  bool get isLoading => status == MaintenanceRequestStatus.loading;
  bool get isSuccess => status == MaintenanceRequestStatus.success;
  bool get isFailure => status == MaintenanceRequestStatus.failure;
}
