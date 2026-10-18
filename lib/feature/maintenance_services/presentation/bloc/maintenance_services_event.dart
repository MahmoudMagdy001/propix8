import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_services_event.freezed.dart';

@freezed
abstract class MaintenanceServicesEvent with _$MaintenanceServicesEvent {
  const factory MaintenanceServicesEvent.started() = MaintenanceServicesStarted;
  const factory MaintenanceServicesEvent.refreshed() = MaintenanceServicesRefreshed;
  const factory MaintenanceServicesEvent.serviceBooked(int serviceId) = MaintenanceServicesServiceBooked;
  const factory MaintenanceServicesEvent.serviceUnbooked(int serviceId) = MaintenanceServicesServiceUnbooked;
}
