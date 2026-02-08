import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/booking_repository.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this._bookingRepository) : super(const BookingState());

  final BookingRepository _bookingRepository;

  Future<void> fetchBookings() async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
        currentPage: 1,
        bookings: [],
      ),
    );

    try {
      final response = await _bookingRepository.getBookings();
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

  Future<void> loadMoreBookings() async {
    if (state.status == RequestStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: RequestStatus.loading));

    try {
      final nextPage = state.currentPage + 1;
      final response = await _bookingRepository.getBookings(page: nextPage);
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
        errorMessage: 'No Internet Connection',
      ),
    );
  }

  Future<void> acceptBooking(int bookingId) async {
    try {
      final success = await _bookingRepository.updateBookingStatus(
        bookingId: bookingId,
        status: 'accepted',
      );
      if (isClosed) return;

      if (success) {
        final updatedBookings = state.bookings.map((booking) {
          if (booking.id == bookingId) {
            return booking.copyWith(status: 'accepted');
          }
          return booking;
        }).toList();
        emit(state.copyWith(bookings: updatedBookings));
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

  Future<void> cancelBooking(int bookingId) async {
    try {
      final success = await _bookingRepository.updateBookingStatus(
        bookingId: bookingId,
        status: 'cancelled',
      );
      if (isClosed) return;

      if (success) {
        final updatedBookings = state.bookings.map((booking) {
          if (booking.id == bookingId) {
            return booking.copyWith(status: 'cancelled');
          }
          return booking;
        }).toList();
        emit(state.copyWith(bookings: updatedBookings));
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

  Future<void> suggestNewTime({
    required int bookingId,
    required String date,
    required String time,
    required String userMessage,
  }) async {
    try {
      final success = await _bookingRepository.suggestNewTime(
        bookingId: bookingId,
        date: date,
        time: time,
        userMessage: userMessage,
      );
      if (isClosed) return;

      if (success) {
        final updatedBookings = state.bookings.map((booking) {
          if (booking.id == bookingId) {
            return booking.copyWith(
              date: date,
              time: time,
              userMessage: userMessage,
            );
          }
          return booking;
        }).toList();
        emit(state.copyWith(bookings: updatedBookings));
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

  Future<void> deleteBooking(int bookingId) async {
    try {
      final success = await _bookingRepository.deleteBooking(bookingId);
      if (isClosed) return;

      if (success) {
        final updatedBookings = state.bookings
            .where((booking) => booking.id != bookingId)
            .toList();
        emit(state.copyWith(bookings: updatedBookings));
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
