import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_bookings_event.freezed.dart';

@freezed
abstract class MaintenanceBookingsEvent with _$MaintenanceBookingsEvent {
  const factory MaintenanceBookingsEvent.fetchInitial() =
      MaintenanceBookingsFetchInitial;
  const factory MaintenanceBookingsEvent.loadMore() =
      MaintenanceBookingsLoadMore;
  const factory MaintenanceBookingsEvent.setNetworkFailure() =
      MaintenanceBookingsSetNetworkFailure;
  const factory MaintenanceBookingsEvent.deleteBooking(int id) =
      MaintenanceBookingsDeleteBooking;
  const factory MaintenanceBookingsEvent.updateBooking({
    required int id,
    required String phone,
    required String address,
    required String message,
  }) = MaintenanceBookingsUpdateBooking;
}
