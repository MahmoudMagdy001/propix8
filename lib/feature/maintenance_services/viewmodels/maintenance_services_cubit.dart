import 'package:flutter_bloc/flutter_bloc.dart';

import '../../maintenance_bookings/models/maintenance_booking_model.dart';
import '../../maintenance_bookings/repositories/maintenance_booking_repository.dart';
import '../repositories/maintenance_service_repository.dart';
import 'maintenance_services_state.dart';

class MaintenanceServicesCubit extends Cubit<MaintenanceServicesState> {
  MaintenanceServicesCubit(this._repository, this._bookingRepository)
    : super(const MaintenanceServicesState());
  final MaintenanceServiceRepository _repository;
  final MaintenanceBookingRepository _bookingRepository;

  Future<void> getMaintenanceServices() async {
    if (state.isLoading) return;

    emit(
      state.copyWith(status: MaintenanceRequestStatus.loading, clearData: true),
    );
    try {
      final results = await Future.wait([
        _repository.getMaintenanceServices(),
        _bookingRepository.getMaintenanceBookings(
          page: 1,
        ), // Fetch first page to check existing bookings
      ]);

      if (isClosed) return;

      final serviceResponse =
          results[0]
              as dynamic; // MaintenanceServiceResponse isn't exported? Or similar type.
      // Based on previous file reading, _repository.getMaintenanceServices() returns a response with .data
      // Let's assume the type is inferred or dynamic for now as the file didn't show imports for the response type explicitly other than usage.
      // Wait, looking at previous `getMaintenanceServices` it returned `response`.
      // The `_repository` type is `MaintenanceServiceRepository`.
      // Let's look at `MaintenanceServicesCubit` again.
      // It was:
      // final response = await _repository.getMaintenanceServices();
      // emit(state.copyWith(..., data: response.data));
      //
      // So results[0] is the response from getMaintenanceServices().
      // results[1] is MaintenanceBookingsListResponse.

      final servicesData = serviceResponse.data;
      final bookingsResponse = results[1] as MaintenanceBookingsListResponse;

      final bookedIds = bookingsResponse.data
          .where((b) => b.service != null)
          .map((b) => b.service!.id)
          .toSet();

      emit(
        state.copyWith(
          status: MaintenanceRequestStatus.success,
          data: servicesData,
          bookedServiceIds: bookedIds,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MaintenanceRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void setNetworkFailure() {
    emit(
      state.copyWith(
        status: MaintenanceRequestStatus.failure,
        errorMessage: 'Network Error',
      ),
    );
  }

  /// Marks a service as booked by adding its ID to the bookedServiceIds set.
  /// This updates the UI reactively without requiring a full data refresh.
  void markServiceAsBooked(int serviceId) {
    final updatedBookedIds = {...state.bookedServiceIds, serviceId};
    emit(state.copyWith(bookedServiceIds: updatedBookedIds));
  }

  /// Removes a service from the bookedServiceIds set.
  /// This updates the UI reactively when a booking is deleted.
  void unmarkServiceAsBooked(int serviceId) {
    final updatedBookedIds = {...state.bookedServiceIds}..remove(serviceId);
    emit(state.copyWith(bookedServiceIds: updatedBookedIds));
  }
}
