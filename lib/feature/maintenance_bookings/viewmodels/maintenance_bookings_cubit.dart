import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/feature/maintenance_bookings/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/maintenance_bookings/viewmodels/maintenance_bookings_state.dart';

class MaintenanceBookingsCubit extends Cubit<MaintenanceBookingsState> {
  MaintenanceBookingsCubit(this._repository)
    : super(const MaintenanceBookingsState());

  final MaintenanceBookingRepository _repository;

  Future<void> getMaintenanceBookings() async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
        currentPage: 1,
        bookings: [],
      ),
    );
    try {
      final response = await _repository.getMaintenanceBookings();
      if (isClosed) return;
      emit(
        state.copyWith(
          status: RequestStatus.success,
          bookings: response.data,
          lastPage: response.pagination?.lastPage ?? 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadMoreMaintenanceBookings() async {
    if (state.status == RequestStatus.loading || !state.hasMore) return;

    final nextPage = state.currentPage + 1;
    try {
      final response = await _repository.getMaintenanceBookings(page: nextPage);
      if (isClosed) return;
      emit(
        state.copyWith(
          status: RequestStatus.success,
          bookings: [...state.bookings, ...response.data],
          currentPage: nextPage,
          lastPage: response.pagination?.lastPage ?? state.lastPage,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void setNetworkFailure() {
    emit(
      state.copyWith(
        status: RequestStatus.failure,
        errorMessage: 'Network Error',
      ),
    );
  }

  Future<void> deleteMaintenanceBooking(int id) async {
    try {
      final success = await _repository.deleteMaintenanceBooking(id);
      if (isClosed) return;
      if (success) {
        final updatedBookings = state.bookings
            .where((booking) => booking.id != id)
            .toList();
        emit(state.copyWith(bookings: updatedBookings));
      }
    } catch (e) {
      // Handle error if needed
    }
  }

  Future<void> updateMaintenanceBooking({
    required int id,
    required String phone,
    required String address,
    required String message,
  }) async {
    emit(state.copyWith(status: RequestStatus.loading));
    try {
      final success = await _repository.updateMaintenanceBooking(
        id: id,
        phone: phone,
        address: address,
        message: message,
      );
      if (isClosed) return;
      if (success) {
        final updatedBookings = state.bookings.map((booking) {
          if (booking.id == id) {
            return booking.copyWith(
              phone: phone,
              address: address,
              message: message,
            );
          }
          return booking;
        }).toList();
        emit(
          state.copyWith(
            status: RequestStatus.success,
            bookings: updatedBookings,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: RequestStatus.failure,
            errorMessage: 'failedToUpdateBooking',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
