import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_booking_state.freezed.dart';

enum BookingSubmissionStatus { initial, loading, success, failure }

@freezed
abstract class MaintenanceBookingState with _$MaintenanceBookingState {
  const factory MaintenanceBookingState({
    @Default(BookingSubmissionStatus.initial) BookingSubmissionStatus status,
    String? errorMessage,
  }) = _MaintenanceBookingState;
}

extension MaintenanceBookingStateX on MaintenanceBookingState {
  bool get isLoading => status == BookingSubmissionStatus.loading;
  bool get isSuccess => status == BookingSubmissionStatus.success;
  bool get isFailure => status == BookingSubmissionStatus.failure;
}
