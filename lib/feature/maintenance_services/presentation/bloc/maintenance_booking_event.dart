import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_booking_event.freezed.dart';

@freezed
abstract class MaintenanceBookingEvent with _$MaintenanceBookingEvent {
  const factory MaintenanceBookingEvent.submitted({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  }) = MaintenanceBookingSubmitted;

  const factory MaintenanceBookingEvent.reset() = MaintenanceBookingReset;
}
