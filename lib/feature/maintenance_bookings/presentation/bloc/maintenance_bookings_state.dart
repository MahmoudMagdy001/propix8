import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';

part 'maintenance_bookings_state.freezed.dart';

enum MaintenanceBookingsStatus { initial, loading, success, failure }

@freezed
abstract class MaintenanceBookingsState with _$MaintenanceBookingsState {
  const factory MaintenanceBookingsState({
    @Default(MaintenanceBookingsStatus.initial) MaintenanceBookingsStatus status,
    @Default([]) List<MaintenanceBookingEntity> bookings,
    String? errorMessage,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
  }) = _MaintenanceBookingsState;

  const MaintenanceBookingsState._();

  bool get hasMore => currentPage < lastPage;
}
